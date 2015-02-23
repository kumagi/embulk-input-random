# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "embulk-input-random"
  spec.version       = "0.0.2"
  spec.authors       = ["KUMAZAKI Hiroki"]
  spec.email         = ["hiroki.kumazaki@gmail.com"]
  spec.summary       = %q{Random Table Generator for Embulk}
  spec.description   = %q{Create dummy table}
  spec.homepage      = "https://github.com/kumagi/embulk-input-random"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
