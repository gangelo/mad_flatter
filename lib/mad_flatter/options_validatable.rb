# frozen_string_literal: true

require_relative 'metadata_optionable'
require_relative 'namespace_optionable'

module MadFlatter
  # Methods to validate options.
  module OptionsValidatable
    include MadFlatter::MetadataOptionable
    include MadFlatter::NamespaceOptionable

    OPTIONS = [OPTION_METADATA, OPTION_NAMESPACE].freeze

    def validate_options!(options:)
      validate_options_type! options: options

      return if options.blank?

      validate_option_keys! options: options
      validate_option_metadata! metadata: options[:metadata]
      validate_option_namespace! namespace: options[:namespace]
    end

    def validate_options_type!(options:)
      raise ArgumentError, "options (#{options.class}) is not a Hash" unless options.is_a? Hash
    end

    def validate_option_keys!(options:)
      invalid_options = options.except(*OPTIONS)&.keys

      return if invalid_options.blank?

      raise ArgumentError, 'One or more option keys were unrecognized. ' \
                           "#{OPTIONS} was expected but '#{invalid_options}' was received."
    end

    def validate_option_metadata!(metadata:)
      return if [TrueClass, FalseClass].include? metadata.class

      raise ArgumentError, "option :#{OPTION_METADATA} value is invalid. " \
                           'A TrueClass/FalseClass was expected ' \
                           "with the acceptable values #{OPTION_METADATA_VALUES} " \
                           "but '#{metadata}' (#{metadata.class}) was received."
    end

    def validate_option_namespace!(namespace:)
      # :namespace is optional.
      return if namespace.blank? || namespace.is_a?(Symbol)

      raise ArgumentError, "option :#{OPTION_NAMESPACE} value is invalid. " \
                           'A Symbol was expected ' \
                           "but '#{namespace}' (#{namespace.class}) was received."
    end
  end
end
