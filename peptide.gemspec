# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = 'peptide'
  spec.version = "0.0.0.0"
  spec.summary = "Some summary"
  spec.description = ' '

  spec.authors = ["Brightworks Digital"]
  spec.email = ["development@brightworks.digital"]
  spec.homepage = "http://peptide-project.org"

  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/peptide-project/peptide"

  spec.files = Dir.glob('{lib,exe}/**/*')
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
