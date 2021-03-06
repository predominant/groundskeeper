## [Unreleased]

### Added
- Apache archive parser for packages using version number directories

### Changed
- Fixed Kafka, Spark and libpipeline returning HTML

### Notes
Accuracy at 73% (462/630)

## [0.1.0]
### Changed
- Applied `$pkg_name` substitution to all pkg_source lines
- Applied `$_url_base` transformations
- Added more formats for sourceforge URIs
- Fix wget-static
- Fallback to release monitoring API to get more coverage

### Notes
Accuracy at 73% (459/627).

### Known bugs

Moved known bugs to [Github Issues](https://github.com/predominant/groundskeeper/issues).

## [0.0.4]
### Added
- Hashicorp release json parsing
- c-ares version string parsing
- Remove prefixed `release-` on version strings
- Erlang processing
- Libsodium override to use Github releases
- Added 'releases' marked pkg_source to github parsing

### Changed
- Sourceforge now supports all common compression formats
- Github ident parsing now handles embedded pkg_name

### Notes
Accuracy at 35% (225/636).

### Known bugs
- Returns a HTML string
  - freetype
  - kafka
  - libpipeline
  - lzip
- `gtk` (?) causes a parse error: `parse error: Invalid numeric literal at line 1, column 10`
- Boost returns a lower version as latest

## [0.0.3]
### Added
- x.org version checking
- Add filters for xz/7z file extensions
- postgres version checking

### Changed
- Check for `apache-` in front of plan names
- force `ant` to use apache latest version check

### Known bugs
- Returns a HTML string
  - freetype
  - libpipeline
  - lzip
- `gtk` causes a parse error: `parse error: Invalid numeric literal at line 1, column 10`

### Notes
Accuracy at 25% (161/637).

## [0.0.1]
### Added
- New project, added everything.

### Notes
Accuracy at 17% (111/645).

[Unreleased]: https://github.com/predominant/groundskeeper/compare/0.0.1...HEAD
[0.0.1]: https://github.com/predominant/groudskeeper/releases/tag/0.0.1
[0.0.3]: https://github.com/predominant/groudskeeper/releases/tag/0.0.3
[0.0.4]: https://github.com/predominant/groudskeeper/releases/tag/0.0.4
[0.1.0]: https://github.com/predominant/groudskeeper/releases/tag/0.1.0
