
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ign_reviews/version"

Gem::Specification.new do |spec|
  spec.name          = "ign-reviews"
  spec.version       = IGNReviews::VERSION
  spec.authors       = ["'Jamilya Ramos-Chapman'"]
  spec.email         = ["'jamilya_ramos-chapman@alumni.brown.edu'"]

  spec.summary       = "IGN Video Game Reviews"
  spec.description   = "Provides details on current and upcoming video games reviewed by IGN."
  spec.homepage      = "https://rubygems.org/gems/ign-reviews"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", '~> 0'
  spec.add_development_dependency "pry", '~> 0'

  spec.add_runtime_dependency "nokogiri", '~> 1.8', '>= 1.8.1'
  spec.add_runtime_dependency "colorize", '~> 0'
end
