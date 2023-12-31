# CHANGELOG

## v0.3.0 - Feb 8, 2023

Refactor to add thread-safety, and rely on Channel and `select` instead of
`IO::Pipe`.

Deprecation: the `timeout` parameter for `Pool.new` is now a `Time::Span`
instead of a `Float64`.

## v0.2.4 - May 12, 2021

Identical to v0.2.3 but installable with Shards 0.14 and Crystal 1.0.

## v0.2.3 - May 12, 2016

Fix:
- Crystal 0.16.0 compatibility

## v0.2.2 - Mar 22, 2016

Fix:
- Crystal 0.14.0 compatibility

## v0.2.1 - Jan 15, 2016

Fix:
- Pool blocks when checkin a connecion too much times.

## v0.2.0 - Dec 18, 2015

Feature:
- Lazily start connections as needed.
