require 'date'
require 'time'
require 'stamp'
require 'i18n'
require 'stamp-l10n/stamp_extension'
require 'stamp-l10n/translator_extension'
require 'stamp-l10n/emitters/am_pm_extension'
require 'stamp-l10n/emitters/lookup_extension'

::Stamp.include StampL10n::StampExtension
::Stamp::Translator.include StampL10n::TranslatorExtension
::Stamp::Emitters::AmPm.extend StampL10n::Emitters::AmPmExtension::ClassMethods
::Stamp::Emitters::Lookup.extend StampL10n::Emitters::LookupExtension::ClassMethods

Date.include Stamp
Time.include Stamp
