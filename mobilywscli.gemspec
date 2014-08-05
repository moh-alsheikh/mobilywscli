# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mobilywscli/version'

Gem::Specification.new do |spec|
  spec.name          = "mobilywscli"  
  spec.version       = Mobilywscli::VERSION
  spec.authors       = ["Mohammed AlSheikh"]
  spec.email         = ["msheikh2009@yahoo.com"]
  spec.description   = "A command-line tool for Mobilyws. http://mobily.ws"
  spec.summary      = "CLI for Mobilyws"
  spec.homepage      = "https://github.com/moh-alsheikh/mobilywscli"
  spec.license       = "MIT"
  spec.bindir = 'bin'
  spec.files         = `git ls-files`.split($/)
  spec.files = Dir["README.md","Gemfile","Rakefile", "mobilywscli.gemspec","lib/**/*"]
  spec.files += Dir.glob('lib/**/*.rb')
  spec.files += Dir.glob('bin/**/*')
  spec.files += Dir.glob('spec/**/*')
  spec.executables   = ["mobilywscli"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.add_dependency 'commander', '~> 4.2'
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency 'rake', '~> 0'
end
