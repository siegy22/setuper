# coding: utf-8
lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'setuper/version'

Gem::Specification.new do |spec|
  spec.name          = "setuper"
  spec.version       = Setuper::VERSION
  spec.authors       = ["Yves Siegrist"]
  spec.email         = ["Elektron1c97@gmail.com"]

  spec.summary       = "Handy cli functions like [y/n]"
  spec.description   = "Have a complex setup for your ruby project? Is your bin/setup full of code with logical operations and functions? This makes it easier to ask the user when setting up what he needs."
  spec.homepage      = "https://github.com/siegy22/easy_cli"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "activesupport", "~> 5.0"
end
