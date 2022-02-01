# frozen_string_literal: true

require_relative 'lib/rwordle/version'

Gem::Specification.new do |spec|
  spec.name = 'rwordle'
  spec.version = Rwordle::VERSION
  spec.authors = ['luizkowalski']
  spec.email = ['luizeduardokowalski@gmail.com']

  spec.summary = 'RWordle is a cheap implementation of Wordle in Ruby.'
  spec.description = 'RWordle is a cheap implementation of Wordle in Ruby.'
  spec.homepage = 'https://luizkowalski.net'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.7.0'

  # spec.metadata['allowed_push_host'] = "Set to your gem server 'https://example.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/luizkowalski/rwordle'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'colorize', '~> 0.8'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata['rubygems_mfa_required'] = 'true'
end
