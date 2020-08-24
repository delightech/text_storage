require_relative 'lib/text_storage/version'

Gem::Specification.new do |spec|
  spec.name          = "text_storage"
  spec.version       = TextStorage::VERSION
  spec.authors       = ["delightech"]
  spec.email         = ["hisafumi.kikkawa@gmail.com"]

  spec.summary       = %q{This is simple text storage.}
  spec.description   = %q{This is simple text storage. Just write text to local file.}
  spec.homepage      = "https://github.com/delightech/text_storage"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  #spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/delightech/text_storage"
  #spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
