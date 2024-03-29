require_relative 'lib/wim_parser/version'

Gem::Specification.new do |spec|
  spec.name          = "wim_parser"
  spec.version       = WimParser::VERSION
  spec.authors       = ["ManageIQ Authors"]

  spec.summary       = %q{Parser for the Windows Image Format (WIM)}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/ManageIQ/wim_parser"
  spec.license       = "Apache 2.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "binary_struct",      "~> 2.1"
  spec.add_dependency "nokogiri",           "~> 1.10"

  spec.add_development_dependency "manageiq-style"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec",     "~> 3.0"
  spec.add_development_dependency "simplecov", ">= 0.21.2"
end
