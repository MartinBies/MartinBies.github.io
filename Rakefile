desc "Build the website into _site"
task :build do
  sh "bundle exec jekyll build --trace"
end

desc "Serve the website locally with automatic browser refresh"
task :preview do
  sh "bundle exec jekyll serve --livereload --host 127.0.0.1 --port 4000"
end
