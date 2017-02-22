# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stamp-l10n/version'

Gem::Specification.new do |spec|
  spec.name          = 'stamp-l10n'
  spec.version       = StampL10n::VERSION
  spec.authors       = ['Dave Allie']
  spec.email         = ['dave@tanda.co']

  spec.summary       = 'Uses Rails Internationalization to bring stamp to all locales.'
  spec.description   = 'Uses Rails Internationalization to bring stamp to all locales.'
  spec.homepage      = 'https://github.com/tandahq/stamp-l10n'
  spec.license       = 'MIT'

  spec.files         = Dir.glob('lib/**/*') + %w(CHANGELOG.md CODE_OF_CONDUCT.md LICENSE.txt README.md)
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop', '~> 0.47.0'
  spec.add_development_dependency 'rspec'
  spec.add_dependency 'stamp', '= 0.6.0'
  spec.add_dependency 'i18n'
end
