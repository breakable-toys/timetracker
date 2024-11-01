require_relative "lib/timetracker/version"

Gem::Specification.new do |spec|
  spec.name        = "timetracker"
  spec.version     = Timetracker::VERSION
  spec.authors     = [ "Gorka" ]
  spec.email       = [ "gorka@hey.com" ]
  spec.homepage    = "https://github.com/breakable-toys/timetracker"
  spec.summary     = "Rails engine to track the time you spend on your projects"
  spec.description = "Rails engine to track the time you spend on your projects"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/breakable-toys/timetracker"
  spec.metadata["changelog_uri"] = "https://github.com/breakable-toys/timetracker"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.2.2"
end
