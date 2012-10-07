# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rubaiji/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Teodor Pripoae"]
  gem.email         = ["toni@netbaiji.com"]
  gem.description   = %q{Ruby bindings for NetBaiji API}
  gem.summary       = %q{Ruby bindings for NetBaiji API}
  gem.homepage      = "http://netbaiji.com/api/documentation"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rubaiji"
  gem.require_paths = ["lib"]
  gem.version       = Rubaiji::VERSION
  gem.add_development_dependency "rspec", "2.11"
  gem.add_development_dependency "growl"
  gem.add_development_dependency "autotest"
  gem.add_development_dependency "autotest-growl"
end
