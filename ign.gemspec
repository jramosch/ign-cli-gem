
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ign/version"

Gem::Specification.new do |spec|
  spec.name          = "ign"
  spec.version       = IGN::VERSION
  spec.authors       = ["'Jamilya Ramos-Chapman'"]
  spec.email         = ["'jamilya_ramos-chapman@alumni.brown.edu'"]

  spec.summary       = "IGN Video Game Reviews"
  spec.description   = "Provides details on current and upcoming video games reviewed by IGN."
  spec.homepage      = "https://github.com/jramosch/ign-cli-gem"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = 'http://mygemserver.com'
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"
  spec.add_dependency "colorize"
end
