#!/usr/bin/env ruby
# frozen_string_literal: true

require "nokogiri"
require "pathname"
require "uri"

SITE_DIR = Pathname.new(ARGV.fetch(0, "_site")).expand_path
INTERNAL_HOSTS = %w[martinbies.github.io www.martinbies.github.io].freeze
errors = []
html_files = Dir[SITE_DIR.join("**/*.html")].sort

abort "No generated HTML found in #{SITE_DIR}; run the Jekyll build first." if html_files.empty?

pages = html_files.to_h do |file|
  relative = Pathname.new(file).relative_path_from(SITE_DIR).to_s
  url = relative == "index.html" ? "/" : "/#{relative.sub(%r{/index\.html\z}, "/") }"
  [url, Nokogiri::HTML5(File.read(file))]
end

def local_target(raw_url, current_url)
  return if raw_url.nil? || raw_url.empty? || raw_url.start_with?("mailto:", "tel:", "data:", "javascript:")

  uri = URI.parse(raw_url)
  return if uri.host && !INTERNAL_HOSTS.include?(uri.host.downcase)

  base = URI("https://martinbies.github.io#{current_url}")
  resolved = uri.host ? uri : URI.join(base.to_s, raw_url)
  [resolved.path.empty? ? "/" : resolved.path, resolved.fragment]
rescue URI::InvalidURIError
  [:invalid, nil]
end

def output_path(url_path)
  decoded = URI::DEFAULT_PARSER.unescape(url_path)
  relative = decoded.sub(%r{\A/}, "")
  return SITE_DIR.join("index.html") if relative.empty?
  return SITE_DIR.join(relative, "index.html") if decoded.end_with?("/")

  SITE_DIR.join(relative)
end

pages.each do |url, document|
  label = url
  errors << "#{label}: missing document title" if document.at_css("title")&.text.to_s.strip.empty?
  errors << "#{label}: missing meta description" unless document.at_css('meta[name="description"][content]:not([content=""])')
  errors << "#{label}: missing canonical URL" unless document.at_css('link[rel="canonical"][href]')
  errors << "#{label}: expected exactly one main element" unless document.css("main").length == 1
  errors << "#{label}: expected exactly one h1" unless document.css("h1").length == 1
  errors << "#{label}: html element requires a lang attribute" if document.at_css("html")&.[]("lang").to_s.empty?

  ids = document.css("[id]").map { |node| node["id"] }
  ids.tally.select { |_, count| count > 1 }.each_key do |id|
    errors << "#{label}: duplicate id ##{id}"
  end

  document.css("img").each do |image|
    errors << "#{label}: image #{image['src']} is missing alt text" unless image.key?("alt")
    errors << "#{label}: image #{image['src']} is missing width/height" unless image["width"] && image["height"]
  end

  document.css("button").each do |button|
    accessible_name = button["aria-label"].to_s.strip
    accessible_name = button.text.strip if accessible_name.empty?
    errors << "#{label}: button is missing an accessible name" if accessible_name.empty?
    errors << "#{label}: button must declare type=button" unless button["type"] == "button"
    controlled_id = button["aria-controls"]
    errors << "#{label}: aria-controls references missing ##{controlled_id}" if controlled_id && document.at_css("##{controlled_id}").nil?
  end

  document.css('a[target="_blank"]').each do |link|
    rel = link["rel"].to_s.split
    errors << "#{label}: target=_blank link lacks rel=noopener" unless rel.include?("noopener")
  end

  document.css("table").each_with_index do |table, index|
    widths = table.css("tr").map { |row| row.css("th, td").length }.reject(&:zero?)
    errors << "#{label}: table #{index + 1} has inconsistent column counts #{widths.uniq.inspect}" if widths.uniq.length > 1
  end

  document.css("a[href], link[href], script[src], img[src]").each do |element|
    raw = element["href"] || element["src"]
    target = local_target(raw, url)
    next unless target

    path, fragment = target
    if path == :invalid
      errors << "#{label}: invalid URL #{raw.inspect}"
      next
    end

    destination = output_path(path)
    unless destination.file?
      errors << "#{label}: #{raw} resolves to missing #{destination.relative_path_from(SITE_DIR)}"
      next
    end

    next unless fragment && destination.extname == ".html"

    target_doc = pages[path.end_with?("/") ? path : path.sub(%r{/index\.html\z}, "/")]
    target_doc ||= Nokogiri::HTML5(destination.read)
    errors << "#{label}: #{raw} references missing fragment ##{fragment}" unless target_doc.at_css("##{fragment}")
  end
end

source = Dir["{_layouts,_pages,assets,index.md}/**/*"].select { |path| File.file?(path) }.map { |path| File.read(path) }.join("\n")
%w[main.min.js jquery-1.12.4 greedy-nav magnificPopup smoothScroll fitVids].each do |legacy|
  errors << "source still references removed legacy code: #{legacy}" if source.include?(legacy)
end

if errors.any?
  warn "Site validation failed with #{errors.length} error(s):"
  errors.each { |error| warn "  - #{error}" }
  exit 1
end

puts "Validated #{html_files.length} HTML pages: structure, accessibility basics, tables, assets, and internal links are sound."
