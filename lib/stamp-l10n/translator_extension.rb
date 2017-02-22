module StampL10n
  module TranslatorExtension
    def translate_with_locale(example, locale = I18n.locale)
      # extract any substrings that look like times, like "23:59" or "8:37 am"
      before, time_example, after = example.partition(::Stamp::Translator::TIME_REGEXP)

      # build emitters from the example date
      emitters = ::Stamp::Emitters::Composite.new
      emitters << build_emitters(before.split(/\b/)) do |token|
        date_emitter_with_locale(token, locale)
      end

      # build emitters from the example time
      unless time_example.empty?
        time_parts = time_example.scan(::Stamp::Translator::TIME_REGEXP).first
        emitters << build_emitters(time_parts) do |token|
          time_emitter_with_locale(token, locale)
        end
      end

      # recursively process any remaining text
      emitters << translate(after) unless after.empty?
      emitters
    end

    def time_emitter_with_locale(token, locale = I18n.locale)
      case token
      when ::Stamp::Translator::MERIDIAN_LOWER_REGEXP
        ::Stamp::Emitters::AmPm.lowercase(locale)
      when ::Stamp::Translator::MERIDIAN_UPPER_REGEXP
        ::Stamp::Emitters::AmPm.uppercase(locale)
      else
        time_emitter(token)
      end
    end

    def date_emitter_with_locale(token, locale = I18n.locale)
      case token
      when ::Stamp::Translator::MONTHNAMES_REGEXP
        ::Stamp::Emitters::Lookup.month(locale)
      when ::Stamp::Translator::ABBR_MONTHNAMES_REGEXP
        ::Stamp::Emitters::Lookup.abbr_month(locale)
      when ::Stamp::Translator::DAYNAMES_REGEXP
        ::Stamp::Emitters::Lookup.day(locale)
      when ::Stamp::Translator::ABBR_DAYNAMES_REGEXP
        ::Stamp::Emitters::Lookup.abbr_day(locale)
      else
        date_emitter(token)
      end
    end
  end
end
