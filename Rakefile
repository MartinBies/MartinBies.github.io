desc "Build the website into _site"
task :build do
  sh "bundle exec jekyll build --trace"
end

desc "Build and validate HTML, accessibility basics, assets, and internal links"
task check: :build do
  sh "bundle exec ruby scripts/check_site.rb"
end

desc "Serve the website locally with automatic browser refresh"
task :preview do
  port = ENV.fetch("PORT", "4000")
  livereload_port = ENV.fetch("LIVERELOAD_PORT", "35729")
  abort "PORT and LIVERELOAD_PORT must be numeric" unless [port, livereload_port].all? { |value| value.match?(/\A\d+\z/) }

  sh "bundle exec jekyll serve --livereload --host 127.0.0.1 --port #{port} --livereload-port #{livereload_port}"
end
