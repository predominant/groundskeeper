# Groundskeeper

A tool designed to parse through all the plan files in [Biome][biome] (or [Habitat][habitat]), and discover the latest version available for that plan.

Output is compact, but simple to understand and read. Each line contains 3 fields. A plan with a detected possible update has a prefixed `> `. An up to date plan has a preceeding pipe `| `.

The fields are:

1. Status
2. plan name
3. current plan version
4. detected latest version

```
| 7zip 16.02 16.02
> R 3.5.0 3.6.0
| acbuild 0.4.0 0.4.0
| acl 2.2.53 2.2.53
| alex 3.2.4 3.2.4
| alsa-lib 1.1.9 1.1.9
> ansible 2.7.11 2.8.1
| ant 1.10.6 unknown
| apr-util 1.6.1 1.6.1
> apr 1.6.5 1.7.0
> artifactory-pro 6.11.0 6.11.1
> artifactory 6.11.0 6.11.1
```

This may not work for all plans consumed, but is designed to be improved over time to encompass as many cases as possible.

You can filter the output as necessary by piping the output through `grep`/`sed`. Examples:

```
# Show all plans with possible updates
./groundskeeper | grep --line-buffered "^>"

# Show all plans that are up to date
./groundskeeper | grep --line-buffered "^|"
```

Want to get super fancy? Get a list of all plans with update candidates as JSON:

```
./groundskeeper | grep "^>" | jq -sRn '[input | split("\n") | .[] | split(" ")]'
```

You will get something like this:

```
[
  [ "|", "7zip", "16.02", "16.02" ],
  [ ">", "R", "3.5.0", "3.6.0" ],
  [ "|", "acbuild", "0.4.0", "0.4.0" ],
  ...
]
```

# Requirements

This was designed and developed on a MacOS machine. As such, certain tools and options might be Mac (or BSD) only.

The goal is to have this implemented as standard Shell, designed for linux systems.

Currently requires the following commands:

* jq
* curl
* uniq
* sort
* grep
* awk
* sed
* find
* tail
* head

# Running

Before running, please ensure you have the following environment variables set:

| Name | Description |
| --- | --- |
| GITHUB_USERNAME | Your github username (Ex: `export GITHUB_USERNAME="predominant"`) |
| GITHUB_TOKEN | Your github personal access token (Ex: `export GITHUB_TOKEN="1234451231351351355"`) |

You can create a personal access token by visiting [your profile on Github](https://github.com/settings/tokens).

These tokens are sent to requests to Github only. They require no permissions, and are simply used to ensure you don't hit API limitations by making anonymous requests.

Run groundskeeper:

```
./groundskeeper
```

# Authors

* Graham Weldon <graham@grahamweldon.com>

# Copyright

Copyright 2019, Graham Weldon <graham@grahamweldon.com>

# License

GNU General Public License v3.0

See LICENSE file.

[biome]: https://github.com/biome-sh
[habitat]: https://github.com/habitat-sh
