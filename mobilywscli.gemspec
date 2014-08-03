# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mobilywscli/version'

Gem::Specification.new do |spec|
  spec.name          = "mobilywscli"
  spec.add_dependency 'commander', '~> 4.2'
  spec.add_dependency 'terminal-notifier', '~> 1.6'
  
  spec.version       = Mobilywscli::VERSION
  spec.authors       = ["Mohammed AlSheikh"]
  spec.email         = ["msheikh2009@yahoo.com"]
  spec.description   = "Mobilywscli description"
  spec.summary       = "Mobilywscli summary"
  spec.homepage      = "http://blog.msheikh.me"
  spec.license       = "MIT"
  
  spec.bindir = 'bin'
  spec.files         = `git ls-files`.split($/)
  spec.files = Dir["README.md","Gemfile","Rakefile", "mobilywscli.gemspec","lib/**/*"]
  #spec.files = %w[CONTRIBUTING.md LICENSE.md README.md Rakefile t.gemspec]
  spec.files += Dir.glob('lib/**/*.rb')
  spec.files += Dir.glob('bin/**/*')
  spec.files += Dir.glob('spec/**/*')
  
  #spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.executables   = ["mobilywscli"]

  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency 'rake', '~> 0'
  
end
