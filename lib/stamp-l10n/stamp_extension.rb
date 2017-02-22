module StampL10n
  module StampExtension
    def locale_stamp(example, locale = I18n.locale)
      memoize_locale_stamp_emitters(example, locale).format(self)
    end
    alias l_stamp locale_stamp

    private

    def locale_stamp_emitters(example, locale = I18n.locale)
      emitters = ::Stamp::Translator.new.translate_with_locale(example, locale)
      Disambiguator.new(emitters).disambiguate!
    end

    def memoize_stamp_emitters(example)
      @@memoized_stamp_emitters ||= {} # rubocop:disable Style/ClassVars
      @@memoized_stamp_emitters[example] ||= {}
      @@memoized_stamp_emitters[example][:en] ||= stamp_emitters(example)
    end

    def memoize_locale_stamp_emitters(example, locale = I18n.locale)
      @@memoized_stamp_emitters ||= {} # rubocop:disable Style/ClassVars
      @@memoized_stamp_emitters[example] ||= {}
      @@memoized_stamp_emitters[example][locale.to_sym] ||= locale_stamp_emitters(example, locale)
    end
  end
end
