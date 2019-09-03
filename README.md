# crtsh

[![Build Status](https://travis-ci.org/ninoseki/crtsh.svg?branch=master)](https://travis-ci.org/ninoseki/crtsh)
[![Coverage Status](https://coveralls.io/repos/github/ninoseki/crtsh/badge.svg?branch=master)](https://coveralls.io/github/ninoseki/crtsh?branch=master)
[![CodeFactor](https://www.codefactor.io/repository/github/ninoseki/crtsh/badge)](https://www.codefactor.io/repository/github/ninoseki/crtsh)

[crt.sh](https://crt.sh) API client for Ruby.

## Installation

```bash
gem install crtsh
```

## Usage

```ruby
require "crtsh"

api = Crtsh::API.new
res = api.search("crt.sh")
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ninoseki/crtsh.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
