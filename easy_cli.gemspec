# coding: utf-8
lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'easy_cli/version'

Gem::Specification.new do |spec|
  spec.name          = "easy_cli"
  spec.version       = EasyCLI::VERSION
  spec.authors       = ["Yves Siegrist"]
  spec.email         = ["Elektron1c97@gmail.com"]

  spec.summary       = "Handy cli functions like [y/n]"
  spec.description   = "e.g. used in a bin/setup which is a bit complicated, to easily setup stuff and don't write too much code in the bin/setup file itself."
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
