# frozen_string_literal: true

require_relative "lib/minitest/hyperbolic/version"

Gem::Specification.new do |spec|
  spec.name          = "minitest-hyperbolic"
  spec.version       = Minitest::Hyperbolic::VERSION
  spec.authors       = ["Alex Mercea"]
  spec.email         = ["alex@lxmrc.com"]

  spec.summary       = "Custom Minitest reporter for Hyperbolic"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
