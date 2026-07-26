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

## Inspect the mobile layout in a desktop browser

Start the preview server with `bundle exec rake preview`, open
<http://127.0.0.1:4000>, and then use your browser’s responsive-design mode.
This emulates a mobile viewport, touch input, pixel density, and orientation; it
does not require a physical phone.

### Chrome, Chromium, or Microsoft Edge

1. Open Developer Tools with `F12` or `Ctrl+Shift+I` (`Cmd+Option+I` on macOS).
2. Toggle the device toolbar with `Ctrl+Shift+M` (`Cmd+Shift+M` on macOS).
3. Select a preset such as **iPhone 14 Pro** or **Pixel 7**, or choose
   **Responsive** and drag the viewport edges.
4. Use the rotate button to test portrait and landscape orientations.
5. Reload once with Developer Tools open. The site versions its CSS and
   JavaScript automatically, so subsequent Jekyll rebuilds should appear
   without stale browser assets.

### Firefox

1. Open Responsive Design Mode with `Ctrl+Shift+M` (`Cmd+Option+M` on macOS).
2. Choose a device preset or enter a custom width and height.
3. Enable touch simulation with the hand icon and use the rotate control to
   test both orientations.

### Safari on macOS

1. In Safari’s advanced settings, enable **Show features for web developers**.
2. Choose **Develop → Enter Responsive Design Mode**, or press `Option+Cmd+R`.
3. Select an iPhone/iPad preset and test portrait and landscape modes.

While testing the burger menu, verify that it opens and closes by touch/click,
closes after selecting a link or clicking outside, closes with `Escape`, moves
keyboard focus into the menu when opened, and returns focus to the menu button
when dismissed with `Escape`.

To build the production site and validate its HTML, accessibility basics,
assets, and internal links:

```sh
bundle exec rake check
```

Use `bundle exec rake build` when only a production build is needed. Check the
Ruby dependencies against the latest security-advisory database with:

```sh
bundle exec rake audit
```

The generated site is written to `_site/`, which is intentionally ignored by
Git.

### Common setup issues

- If `bundle` is unavailable, install Bundler with `gem install bundler`.
- If native gems fail to compile on Debian or Ubuntu, install the Ruby
  development tools with `sudo apt install ruby-dev build-essential` and retry
  `bundle install`.

## Copyright

Copyright © Martin Bies. All rights reserved. No license is granted for the
website source, design, or personal and academic materials unless explicitly
stated otherwise. Development dependencies recorded in `Gemfile.lock` are not
part of the published website and remain subject to their respective licenses.
