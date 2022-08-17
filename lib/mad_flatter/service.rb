# frozen_string_literal: true

require_relative 'hash_loadable'
require_relative 'optionable'

module MadFlatter
  # This class provides functionality to load and flatten a Hash.
  # Default options passed to the constructor may be overridden with
  # options passed to the #execute method.
  class Service
    include HashLoadable
    include Optionable

    def initialize(options: nil)
      # Accept whatever options are sent, but make sure
      # we have defaults set up. #with_defaults
      # will merge options into OptionsDefaultable::DEFAULT_OPTIONS
      # so we have defaults for any options not passed.
      self.options = Options.with_defaults options
    end

    def execute(hash:, options: nil)
      # Merge options received into the default options passed through
      # the constructor. Options received here, will override any options
      # passed to the constructor, allowing us to retain defaut options
      # while loading, and also provide option overrides as needed.
      options = Options.with_defaults(options, defaults: self.options)

      load_hash(hash, options)
    end
  end
end
