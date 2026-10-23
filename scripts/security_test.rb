# frozen_string_literal: true

require "minitest/autorun"
require "fileutils"
require "tmpdir"
require "open3"
require "nokogiri"
require "jekyll"

class SecurityTest < Minitest::Test
  ROOT = File.expand_path("..", __dir__)
  SITE = File.join(ROOT, "_site")

  def setup
    @directory = Dir.mktmpdir("site-security-test-")
    # Copy HTML for mutation; link large, immutable public assets.
    Dir.children(SITE).each do |name|
      source = File.join(SITE, name)
      destination = File.join(@directory, name)
      if %w[Materials assets].include?(name)
        FileUtils.ln_s(source, destination)
      else
        FileUtils.cp_r(source, destination)
      end
    end
  end

  def teardown
    FileUtils.remove_entry(@directory)
  end

  def validate
    Open3.capture2e(RbConfig.ruby, File.join(ROOT, "scripts/check_site.rb"), @directory, chdir: ROOT)
  end

  def mutate(markup)
    path = File.join(@directory, "index.html")
    File.write(path, File.read(path).sub("</body>", "#{markup}</body>"))
  end

  def assert_rejected(markup, message)
    mutate(markup)
    output, status = validate
    refute status.success?, output
    assert_includes output, message
  end

  def test_production_site_passes
    output, status = validate
    assert status.success?, output
  end

  def test_inline_script_is_rejected
    assert_rejected('<script>alert(1)</script>', "inline scripts are forbidden")
  end

  def test_inline_event_handler_is_rejected
    assert_rejected('<a href="/" onclick="alert(1)">Home</a>', "inline event handlers are forbidden")
  end

  def test_javascript_url_is_rejected
    assert_rejected('<a href="javascript:alert(1)">Unsafe</a>', "unsupported URL scheme")
  end

  def test_external_script_is_rejected
    assert_rejected('<script src="https://example.org/injected.js"></script>', "third-party resource is not permitted")
  end

  def test_missing_csp_is_rejected
    path = File.join(@directory, "index.html")
    document = Nokogiri::HTML5(File.read(path))
    document.at_css('meta[http-equiv="Content-Security-Policy"]').remove
    File.write(path, document.to_html)
    output, status = validate
    refute status.success?, output
    assert_includes output, "content security policy is missing"
  end

  def test_encoded_path_traversal_is_rejected
    assert_rejected('<a href="/%2e%2e/Gemfile">Outside</a>', "resolves outside the generated site")
  end

  def test_missing_internal_link_is_rejected
    assert_rejected('<a href="/nonexistent-file.html">Missing</a>', "resolves to missing")
  end

  def test_fragment_is_matched_as_literal_id_not_css_selector
    assert_rejected('<a href="#main-content%2Cbody">Invalid fragment</a>', "references missing fragment")
  end

  def test_encoded_fragment_with_punctuation_is_supported
    mutate('<p id="example:1">Example</p><a href="#example%3A1">Example link</a>')
    output, status = validate
    assert status.success?, output
  end

  def test_development_files_are_not_published
    %w[Gemfile Gemfile.lock Rakefile README.md scripts test website-push.sh].each do |name|
      refute File.exist?(File.join(SITE, name)), "Published development file: #{name}"
    end
  end

  def test_metadata_cannot_inject_html_or_attributes
    payload = %q{\"><script data-injected="yes">alert(1)</script><span title="}
    config = Jekyll.configuration("source" => ROOT, "destination" => File.join(@directory, "render"), "quiet" => true)
    config["title"] = payload
    config["author"]["name"] = payload
    site = Jekyll::Site.new(config)
    site.reset
    site.read
    site.pages.each { |page| page.data["title"] = payload }
    site.generate
    site.render
    site.pages.select { |page| page.output_ext == ".html" }.each do |page|
      document = Nokogiri::HTML5(page.output)
      assert_empty document.css("[data-injected]"), page.url
      assert_equal payload, document.at_css("h1").text, page.url
      assert_equal "Portrait of #{payload}", document.at_css(".profile__portrait")["alt"], page.url
    end
  end
end
