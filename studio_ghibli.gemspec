
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "studio_ghibli/version"

Gem::Specification.new do |spec|
  spec.name          = "studio_ghibli"
  spec.version       = StudioGhibli::VERSION
  spec.authors       = ["Diapause"]
  spec.email         = ["diapause@protonmail.com"]

  spec.summary       = %q{A Studio Ghibli Ruby gem that provides a Command Line Interface (CLI) to an external data source}
  spec.description   = %q{This gem hits a Studio Ghibli api and pulls down all information related to their films. You can search by film, character, location setting, character species, and vehicles for a more detailed description about each topic, including what films each appears in and characters it is related to.}
  spec.homepage      = "https://github.com/capricious-slingshot/studio_ghibli"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/capricious-slingshot/studio_ghibli"
    # spec.metadata["changelog_uri"] = "todo: Put your gem's CHANGELOG.md URL here."
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.10.3"

  spec.add_dependency  'nokogiri', '~> 1.6', '>= 1.6.6.2'
end
