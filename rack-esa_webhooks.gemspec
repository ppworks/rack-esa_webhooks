# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack/esa_webhooks/version'

Gem::Specification.new do |spec|
  spec.name          = 'rack-esa_webhooks'
  spec.version       = Rack::EsaWebhooks::VERSION
  spec.authors       = ['Koshikawa']
  spec.email         = ['koshikawa@ppworks.jp']

  spec.summary       = 'Rack middleware to check esa webhooks are authentic'
  spec.homepage      = 'https://github.com/ppworks/rack-esa_webhook'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'simplecov'
end
