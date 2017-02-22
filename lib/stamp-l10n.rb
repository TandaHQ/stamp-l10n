require 'date'
require 'time'
require 'stamp'
require 'i18n'
require 'stamp-l10n/stamp_extension'
require 'stamp-l10n/translator_extension'
require 'stamp-l10n/emitters/am_pm_extension'
require 'stamp-l10n/emitters/lookup_extension'

module Stamp
  prepend StampL10n::StampExtension

  class Translator
    prepend StampL10n::TranslatorExtension
  end

  module Emitters
    class AmPm
      class << self
        prepend StampL10n::Emitters::AmPmExtension::ClassMethods
      end
    end
    class Lookup
      class << self
        prepend StampL10n::Emitters::LookupExtension::ClassMethods
      end
    end
  end
end

Date.send(:include, Stamp)
Time.send(:include, Stamp)
