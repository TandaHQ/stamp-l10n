module StampL10n
  module Emitters
    module LookupExtension
      module ClassMethods
        def month(locale = I18n.locale)
          ::Stamp::Emitters::Lookup.new(:month, I18n.t('date.month_names', locale: locale))
        end

        def abbr_month(locale = I18n.locale)
          ::Stamp::Emitters::Lookup.new(:month, I18n.t('date.abbr_month_names', locale: locale))
        end

        def day(locale = I18n.locale)
          ::Stamp::Emitters::Lookup.new(:wday, I18n.t('date.day_names', locale: locale))
        end

        def abbr_day(locale = I18n.locale)
          ::Stamp::Emitters::Lookup.new(:wday, I18n.t('date.abbr_day_names', locale: locale))
        end
      end
    end
  end
end
