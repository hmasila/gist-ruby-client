
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "gist/ruby/client/version"

Gem::Specification.new do |spec|
  spec.name          = "gist-ruby-client"
  spec.version       = Gist::Ruby::Client::VERSION
  spec.authors       = ["Hannah Masila"]
  spec.email         = ["hannahmasila@gmail.com"]

  spec.summary       = %q{A Gist Ruby client used to integrate Gist into other software applications and custom workflows.}
  spec.description   = %q{Gist is a customer communication and marketing automation platform that helps you grow your business and engage with your customers across their lifecycle.
                          It is a complete marketing and growth stack for your business - with live chat, email marketing, automation, event tracking and lead gen forms }
  spec.homepage      = "https://rubygems.org/gems/gist-ruby-client"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/hmasila/gist-ruby-client"
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

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
