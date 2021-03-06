
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "compost_cli/version"

Gem::Specification.new do |spec|
  spec.name          = "compost_cli"
  spec.version       = CompostCli::VERSION
  spec.authors       = ["'Denali Balser'"]
  spec.email         = ["'denali.balser167@gmail.com'"]

  spec.summary       = "TEST"
  spec.description   = "TEST"
  spec.homepage      = "http://mygemserver.com" 
  spec.license       = "MIT"
  

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe" #or change back to 'bin'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  #spec.add_development_dependency "rspec"
  #spec.add_development_dependency "pry", "~> 0.10.4"
  
  #spec.add_dependency "nokogiri", "~> 1.8"
  
end
