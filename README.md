# ApmTraceable::Datadog

[![Gem Version](https://badge.fury.io/rb/apm_traceable-datadog.svg)](https://badge.fury.io/rb/apm_traceable-datadog)
[![Build Status](https://github.com/kokuyouwind/apm_traceable-datadog/actions/workflows/main.yml/badge.svg)](https://github.com/kokuyouwind/apm_traceable-datadog/actions/workflows/main.yml)

[APM Traceable gem](https://github.com/kokuyouwind/apm_traceable) の [Datadog APM](https://docs.datadoghq.com/ja/tracing/) 用アダプターです。

## Installation

APM Traceable とこのgemの2つを Gemfile に記述します。


```ruby
gem 'apm_traceable'
gem 'apm_traceable-datadog' # Datadogの場合
```

その後、以下を実行してください。

    $ bundle install

アダプタを設定する際、Datadog APM のサービス名を `service_name` に指定してください。

```ruby
ApmTraceable.configure do |config|
  config.adapter = 'datadog', { service_name: 'test_service' }
end
```

## Usage

利用方法は [APM Traceable の README](https://github.com/kokuyouwind/apm_traceable#usage) を参照してください。

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kokuyouwind/apm_traceable-datadog.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
