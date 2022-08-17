# frozen_string_literal: true

require_relative 'metadata_optionable'
require_relative 'namespace_optionable'

module MadFlatter
  # Defines default options and their optionn values.
  module OptionsDefaultable
    include MadFlatter::MetadataOptionable
    include MadFlatter::NamespaceOptionable

    DEFAULT_OPTIONS = {
      OPTION_NAMESPACE => OPTION_NAMESPACE_DEFAULT,
      OPTION_METADATA => OPTION_METADATA_DEFAULT
    }.freeze
  end
end
