# WimParser

[![Gem Version](https://badge.fury.io/rb/wim_parser.svg)](http://badge.fury.io/rb/wim_parser)
[![CI](https://github.com/ManageIQ/wim_parser/actions/workflows/ci.yaml/badge.svg)](https://github.com/ManageIQ/wim_parser/actions/workflows/ci.yaml)
[![Code Climate](https://codeclimate.com/github/ManageIQ/wim_parser.svg)](https://codeclimate.com/github/ManageIQ/wim_parser)
[![Test Coverage](https://codeclimate.com/github/ManageIQ/wim_parser/badges/coverage.svg)](https://codeclimate.com/github/ManageIQ/wim_parser/coverage)

Parser for the Windows Image Format (WIM)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wim_parser'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install wim_parser

## Usage

```ruby
p = WimParser.new("path/to/file.wim")

p.header
# => {
#   "image_tag"                   => "MSWIM\0\0\0",
#   "size"                        => 208,
#   "version"                     => 68864,
#   "flags"                       => 0x00020082,
#   "compression_size"            => 32768,
#   "wim_guid"                    => "N\x91-\xF7a'\x8D@\x9A0\xC5\xF1~\xD7X\x16", # real GUID is pending adding support for winnt.h GUID structure parsing
#   "part_number"                 => 1,
#   "total_parts"                 => 1,
#   "image_count"                 => 2,
#   "offset_table_size"           => 150,
#   "offset_table_flags"          => 0x02000000,
#   "offset_table_offset"         => 2254,
#   "offset_table_original_size"  => 150,
#   "xml_data_size"               => 1644,
#   "xml_data_flags"              => 0x02000000,
#   "xml_data_offset"             => 2404,
#   "xml_data_original_size"      => 1644,
#   "boot_metadata_size"          => 0,
#   "boot_metadata_flags"         => 0x00000000,
#   "boot_metadata_offset"        => 0,
#   "boot_metadata_original_size" => 0,
#   "boot_index"                  => 0,
#   "integrity_size"              => 0,
#   "integrity_flags"             => 0x00000000,
#   "integrity_offset"            => 0,
#   "integrity_original_size"     => 0,
#   "unused"                      => ("\0" * 60),
# }

p.xml_data
# => {
#   "total_bytes" => 2404,
#   "images"      => [
#     {
#       "index"                  => 1,
#       "name"                   => "Nothing",
#       "description"            => "Empty Windows Disk",
#       "dir_count"              => 3,
#       "file_count"             => 0,
#       "total_bytes"            => 0,
#       "hard_link_bytes"        => 0,
#       "creation_time"          => "2012-09-01 04:05:53 UTC",
#       "last_modification_time" => "2012-09-01 04:05:53 UTC",
#     },
#     {
#       "index"                  => 2,
#       "name"                   => "appended image",
#       "description"            => "some files added",
#       "dir_count"              => 5,
#       "file_count"             => 1,
#       "total_bytes"            => 4,
#       "hard_link_bytes"        => 0,
#       "creation_time"          => "2012-09-01 04:08:59 UTC",
#       "last_modification_time" => "2012-09-01 04:08:59 UTC",
#     },
#   ]
# }

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ManageIQ/wim_parser. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/ManageIQ/wim_parser/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [Apache License 2.0](https://opensource.org/licenses/Apache-2.0).

## Code of Conduct

Everyone interacting in the WimParser project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/ManageIQ/wim_parser/blob/master/CODE_OF_CONDUCT.md).
