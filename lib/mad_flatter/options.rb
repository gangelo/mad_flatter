# frozen_string_literal: true

require 'immutable_struct_ex'
require_relative 'options_defaultable'
require_relative 'options_validatable'

module MadFlatter
  # Defines methods to create options.
  module Options
    extend MadFlatter::OptionsDefaultable
    extend MadFlatter::OptionsValidatable

    class << self
      def new(**options)
        immutable_struct_ex = ImmutableStructEx.new(**options) do
          def namespace?
            return false unless respond_to? :namespace

            namespace || false
          end

          def metadata?
            # This should never return false since
            # the :metadata option is required.
            return false unless respond_to? :metadata

            metadata || false
          end
        end
        validate_options! options: immutable_struct_ex.to_h
        immutable_struct_ex
      end

      def with_defaults(options, defaults: DEFAULT_OPTIONS)
        validate_options_type!(options: options) unless options.respond_to? :to_h

        new(**defaults.to_h.merge(options.to_h))
      end

      def default
        with_defaults({})
      end
    end
  end
end
