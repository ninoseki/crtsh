# crtsh

[![Ruby CI](https://github.com/ninoseki/crtsh/actions/workflows/test.yml/badge.svg)](https://github.com/ninoseki/crtsh/actions/workflows/test.yml)
[![Coverage Status](https://coveralls.io/repos/github/ninoseki/crtsh/badge.svg?branch=master)](https://coveralls.io/github/ninoseki/crtsh?branch=master)
[![CodeFactor](https://www.codefactor.io/repository/github/ninoseki/crtsh/badge)](https://www.codefactor.io/repository/github/ninoseki/crtsh)

[crt.sh](https://crt.sh) API client for Ruby.

## Installation

```bash
gem install crtsh-rb
```

## Usage

```ruby
require "crtsh"

# Interact with Web API
api = Crtsh::API.new
api.search("crt.sh")
api.search("crt.sh", match: "LIKE")
api.search("crt.sh", exclude: "expired")
api.search("crt.sh", match: "LIKE", exclude: "expired")

# Interact with DB
db = Crtsh::DB.new
sql = """
SELECT digest(certificate.certificate, 'sha256') sha256
FROM certificate_identity, certificate
WHERE certificate.id = certificate_identity.certificate_id
AND x509_notAfter(certificate.certificate) > statement_timestamp()
AND reverse(lower(certificate_identity.name_value)) LIKE reverse(lower($1))
LIMIT 10
"""
# Crtsh::DB#connection returns PG::Connection
result = db.connection.exec_params(sql, ["github.com"])
p result.values
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ninoseki/crtsh.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
