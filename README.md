### discourse-atom-receiver

Install this plugin in development mode, and [discourse-atom-trigger](https://github.com/discourse/discourse-atom-trigger) as an
atom package, to receive pings from Atom when a file is saved so it can
autoreload.

This is useful on Windows when working on a VM with a shared folder, as
normally Linux cannot see filesystem events with shared folders. When
you save a file it will send a ping to Discourse to refresh the file.

