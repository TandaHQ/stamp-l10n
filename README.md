## -- DEPRECATED --

By setting up I18n formats, you can leverage the translations by defining you're own formats in locale files and adding the following initializer to your rails app:

```ruby
# config/initializers/date_time_to_ls_extension.rb

module DateTimeToLsExtension
  def to_ls(format = :default, **opts)

    opts[:format] = if format.to_s.include?('ordinal')
      I18n.t(format, scope: [self.respond_to?(:sec) ? 'time' : 'date', :formats], ordinal: self.day.ordinalize)
    else
      format.to_sym
    end

    I18n.localize(self, opts)
  end
end

Date.prepend(DateTimeToLsExtension)
Time.prepend(DateTimeToLsExtension)
```

This extends the `Date`, `Time` and `ActiveSupport` date/time objects with the `to_ls` helper, which just simplifies calling `I18n.localize`, and adds the ability to have day of month ordinals (i.e. '2nd March')

# StampL10n

[![Build Status](https://travis-ci.org/TandaHQ/stamp-l10n.svg?branch=master)](https://travis-ci.org/TandaHQ/stamp-l10n)

Successor to [stamp-i18n](https://github.com/karpiu/stamp-i18n), designed to work with newer versions of [stamp](https://github.com/jeremyw/stamp).

Uses Rails Internationalization to bring stamp to all locales.

## Installation

Add this line to your application's Gemfile:

```ruby
# Stamp changes a lot between versions, so make sure to pin its version
gem 'stamp', '= 0.6.0'
gem 'stamp-l10n'
```

And then execute:

    $ bundle

## Before using

This gem uses i18n translation mechnism, which means before using it, first we need to add proper translation files to locales folder and then setup i18n configuration. Example YML files used for testing is written in few various languages and are located in ./locale folder. Look for more examples here: https://github.com/svenfuchs/rails-i18n/tree/master/rails/locale

## Usage

Same as [stamp](https://github.com/jeremyw/stamp), but gives the option of `locale_stamp`, or `l_stamp` (an alias) for when you need your stamped content to be localized.

```ruby
date = Date.new(2017, 02, 22)
date.stamp('Tuesday 12th March')
#=> "Wednesday 22nd February"
```

Using the new `locale_stamp` method:

```ruby
date = Date.new(2017, 02, 22)
date.locale_stamp('Tuesday 12th March')  # default locale is :de
#=> "Mittwoch 22nd Februar"
date.l_stamp('Tuesday 12th March')       # default locale is :pl
#=> "środa 22nd luty"
```

You can also optionally override the locale used:

```ruby
date = Date.new(2017, 02, 22)
date.locale_stamp('Tuesday 12th March', :de)  # default locale is :en
#=> "Mittwoch 22nd Februar"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tandahq/stamp-l10n. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
