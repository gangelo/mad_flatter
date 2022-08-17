# MadFlatter

[![GitHub version](http://badge.fury.io/gh/gangelo%2Fmad_flatter.svg)](https://badge.fury.io/gh/gangelo%2Fmad_flatter)

[![Gem Version](https://badge.fury.io/rb/mad_flatter.svg)](https://badge.fury.io/rb/mad_flatter)

[![](http://ruby-gem-downloads-badge.herokuapp.com/mad_flatter?type=total)](http://www.rubydoc.info/gems/mad_flatter/)
[![Documentation](http://img.shields.io/badge/docs-rdoc.info-blue.svg)](http://www.rubydoc.info/gems/mad_flatter/)

[![Report Issues](https://img.shields.io/badge/report-issues-red.svg)](https://github.com/gangelo/mad_flatter/issues)

[![License](http://img.shields.io/badge/license-MIT-yellowgreen.svg)](#license)

This is a work in process. No breaking changes are expected before v1.0.0.

TODO: Add specs.
TODO: Better documentation.

mad_flatter is a Ruby gem that takes a Ruby `Hash` and flattens the Hash keys to
create a new Hash with unique Hash keys; that is, embedded Hashes use their
respective keys as namespaces to create unique keys across the entire Hash.
For example:

```ruby
user0 = {
  name: 'john',
  wife: { name: 'mary' },
  children: {
    child0: 'sam',
    child1: 'martha'
  }
}

result0 = MadFlatter::Service.new.execute(hash: user0)
#=>
{
  :name=>"john",
  :wife_name=>"mary",
  :children_child0=>"sam",
  :children_child1=>"martha"
}
```

The `:namespace` option may be used to append to all Hash keys, to ensure that all Hash keys are unique across multiple Hashes with the same structure. For example:

```ruby
# Continuing from the above example...
user1 = {
  name: 'james',
  wife: { name: 'molly' },
  children: {
    child0: 'steve',
    child1: 'maybell'
  }
}

options = { namespace: :ns1 }
result1 = MadFlatter::Service.new.execute(hash: user1, options: options)
#=>
{
  :ns1_name=>"james",
  :ns1_wife_name=>"molly",
  :ns1_children_child0=>"steve",
  :ns1_children_child1=>"maybell"
}

result0.merge(result1)
#=>
{
  :name=>"john",
  :wife_name=>"mary",
  :children_child0=>"sam",
  :children_child1=>"martha",
  :ns1_name=>"james",
  :ns1_wife_name=>"molly",
  :ns1_children_child0=>"steve",
  :ns1_children_child1=>"maybell"
}
```

The metadata can optionally be returned by setting the `:metadata` option
to true. This option is `false` by default. For example:

```ruby
best_cake = {
  name: 'black forest',
  options: {
    cherries: false
  }
}

options = { namespace: :best_cake, metadata: true }
result = MadFlatter::Service.new(options: options).execute(hash: best_cake)
#=>
{
  :best_cake_name=>
    {
      :value=>"black forest",
      :metadata=> {
        :key=>:name,
        :dig=>[]
      }
    },
  :best_cake_options_cherries=> {
    :value=>false,
    :metadata=> {
      :key=>:cherries,
      :dig=>[:options]
    }
  }
}

result.each_pair do |key, value|
  original_key = value[:metadata][:key]
  original_value = best_cake.dig(*value[:metadata][:dig], original_key)
  puts 'Original Hash key/value:'
  puts "\t#{original_key} => \"#{original_value}\""
  puts 'New Hash key/value:'
  puts "\t#{key} => \"#{value[:value]}\""
  puts
end
```
Prints:

```
Original Hash key/value:
	name => "black forest"
New Hash key/value:
	best_cake_name => "black forest"

Original Hash key/value:
	cherries => "false"
New Hash key/value:
	best_cake_options_cherries => "false"
```


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mad_flatter'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install mad_flatter

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/mad_flatter. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/mad_flatter/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the MadFlatter project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/mad_flatter/blob/main/CODE_OF_CONDUCT.md).
