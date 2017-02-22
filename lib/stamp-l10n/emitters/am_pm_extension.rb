module StampL10n
  module Emitters
    module AmPmExtension
      module ClassMethods
        def lowercase(locale = I18n.locale)
          ::Stamp::Emitters::AmPm.new { |v| I18n.t(v, scope: 'time', locale: locale) }
        end

        def uppercase(locale = I18n.locale)
          ::Stamp::Emitters::AmPm.new { |v| I18n.t(v, scope: 'time', locale: locale).upcase }
        end
      end
    end
  end
end
