# Groundskeeper

A tool designed to parse through all the plan files in Biome (or Habitat), and discover the latest version available for that plan.

Output is verbose, but simple to understand and read:

```
7zip:
  Plan version  : 16.02
  Latest version: 16.02

R:
  Plan version  : 3.5.0
  Latest version: 3.6.0
  ^--- Maybe requires update

acbuild:
  Plan version  : 0.4.0
  Latest version: 0.4.0

acl:
  Plan version  : 2.2.53
  Latest version: 2.2.53

alex:
  Plan version  : 3.2.4
  Latest version: 3.2.4

alsa-lib:
  Plan version  : 1.1.9
  Latest version: 1.1.9

ansible:
  Plan version  : 2.7.11
  Latest version: 2.8.1
  ^--- Maybe requires update
```

This may not work for all plans consumed, but is designed to be improved over time to encompass as many cases as possible.

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

# Authors

* Graham Weldon <graham@grahamweldon.com>

# Copyright

Copyright 2019, Graham Weldon <graham@grahamweldon.com>

# License

GNU General Public License v3.0

See LICENSE file.
