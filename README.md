# Setuper
[![Build Status](https://travis-ci.org/siegy22/setuper.svg?branch=master)](https://travis-ci.org/siegy22/setuper)

Handy functions to interact with the cli.
Mostly used in a complex `bin/setup` script.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'setuper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install setuper

## Usage

Let the user answer with yes or no:

```ruby
Setuper.yn?("Are you feeling good?")
# Are you feeling good? [y/n]
# y
# => true
```

Ask the user anything:

```ruby
Setuper.ask("What's 1 + 1?")
# What's 1 + 1?
# 2 (user input)
# => "2"
```

Let the user give you a list of things (aliased as `list`):

```ruby
Setuper.ask_for_list("What are the family member of 'The Simpsons'?")
# What are the family member of 'The Simpsons'? (comma seperated)
# Homer, Marge, Maggie, Bart, Lisa
# => ["Homer", "Marge", "Maggie", "Bart", "Lisa"]
```

Or let him pick just one item (aliased as `pick`):

(`question:` is a keyword argument and defaults to "Please choose:")
```ruby
Setuper.choose("Donald Trump", "Hillary Clinton", question: "Who's the winner of the 2016 elections?")
# Who's the winner of the 2016 elections?
#   Type 1 for "Donald Trump"
#   Type 2 for "Hillary Clinton"
# 1
# => "Donald Trump"
```

### Advanced

You can even change the io Setuper should use. The default is `Kernel`.

```ruby
Setuper.io = MyCustomIO
```

How to use in a bin/setup:

First, add it to your gemfile:

```ruby
group :setup do
  gem 'setuper'
end
```

Then in your `bin/setup` do this:

```ruby
# ...

puts '== Installing dependencies =='
system! 'gem install bundler --conservative'
system('bundle check') || system!('bundle install')

# Make sure that these lines are placed after `bundle install`
require 'bundler'
Bundler.require(:setup)

include Setuper
theme = ask("What's your theme?")
File.write(APP_ROOT + ".theme", theme)
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/siegy22/setuper. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
