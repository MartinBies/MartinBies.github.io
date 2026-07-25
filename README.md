# Martin Bies's homepage

This is the source for <https://martinbies.github.io>. GitHub Pages builds it
with Jekyll whenever changes are pushed to the repository.

## Preview locally

The site requires Ruby, Bundler, and the dependencies pinned in `Gemfile.lock`.
From the repository root, install the dependencies once:

```sh
bundle install
```

Then start the local preview server:

```sh
bundle exec rake preview
```

Open <http://127.0.0.1:4000> in a browser. Jekyll watches the source files and
rebuilds the site when they change; LiveReload refreshes the browser. Stop the
server with `Ctrl+C`. If either port is already occupied, choose alternatives:

```sh
PORT=4100 LIVERELOAD_PORT=35730 bundle exec rake preview
```

To build the production site and validate its HTML, accessibility basics,
assets, and internal links:

```sh
bundle exec rake check
```

Use `bundle exec rake build` when only a production build is needed.

The generated site is written to `_site/`, which is intentionally ignored by
Git.

### Common setup issues

- If `bundle` is unavailable, install Bundler with `gem install bundler`.
- If native gems fail to compile on Debian or Ubuntu, install the Ruby
  development tools with `sudo apt install ruby-dev build-essential` and retry
  `bundle install`.
