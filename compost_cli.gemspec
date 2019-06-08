
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "compost_cli/version"

Gem::Specification.new do |spec|
  spec.name          = "compost_cli"
  spec.version       = CompostCli::VERSION
  spec.authors       = ["'Denali Balser'"]
  spec.email         = ["'denali.balser167@gmail.com'"]

  spec.summary       = %q{A ruby gem to make composting more accessible in NYC.}
  spec.description   = %q{A ruby gem to view composting drop-off locations in the five boroughs of NYC.}
  spec.homepage      = "https://github.com/denalibalser/compost_cli" 
  spec.license       = "MIT"
  

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  #end
  spec.bindir        = "exe" #or change back to 'bin'
  spec.executables   = [compost_cli]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry", "~> 0.10.4"
  
  spec.add_dependency "nokogiri", "~> 1.8"
  
end
