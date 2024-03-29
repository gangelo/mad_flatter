# frozen_string_literal: true

require_relative "lib/mad_flatter/version"

Gem::Specification.new do |spec|
  spec.name = "mad_flatter"
  spec.version = MadFlatter::VERSION
  spec.authors = ["gangelo"]
  spec.email = ["web.gma@gmail.com"]

  spec.summary = "mad_flatter gem"
  spec.description = "mad_flatter gem"
  spec.homepage = "https://github.com/gangelo/mad_flatter"
  spec.license = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 3.0.1", "< 4.0")

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/gangelo/mad_flatter"
  spec.metadata["changelog_uri"] = "https://github.com/gangelo/mad_flatter/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'activesupport', '>= 7.0.8', '< 7.2.0'
  spec.add_runtime_dependency 'immutable_struct_ex', '>= 1.0', '< 2.0'

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html

  spec.post_install_message = <<~POST_INSTALL
    Thank you for installing mad_flatter.

    View the mad_flatter README.md here: https://github.com/gangelo/mad_flatter
    View the mad_flatter CHANGELOG.md: https://github.com/gangelo/mad_flatter/blob/main/CHANGELOG.md

                *
               ***
             *******
            *********
     ***********************
        *****************
          *************
         ******* *******
        *****       *****
       ***             ***
      **                 **

    Using mad_flatter? mad_flatter is made available free of charge. Please consider giving mad_flatter a STAR on GitHub as well as sharing mad_flatter with your fellow developers on social media.

    Knowing that mad_flatter is being used and appreciated is a great motivator to continue developing and improving mad_flatter.

    >>> Star it on github: https://github.com/gangelo/mad_flatter
    >>> Share on social media: https://rubygems.org/gems/mad_flatter

    Thank you!

    <3 Gene
  POST_INSTALL
end
