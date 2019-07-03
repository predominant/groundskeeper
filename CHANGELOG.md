## [Unreleased]
### Added
- Hashicorp release json parsing

### Notes
Accuracy at 26% (166/636).

### Known bugs
- Returns a HTML string
  - freetype
  - kafka
  - libpipeline
  - lzip
- `gtk` causes a parse error: `parse error: Invalid numeric literal at line 1, column 10`

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
