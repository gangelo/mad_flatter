# frozen_string_literal: true

module MadFlatter
  # Defines the metadata option hash key and acceptable hash key values.
  module MetadataOptionable
    # The option hash key for this option.
    OPTION_METADATA = :metadata
    # The valid option values for this option key.
    OPTION_METADATA_INCLUDE = true
    OPTION_METADATA_EXCLUDE = false
    # The default value for this option.
    OPTION_METADATA_DEFAULT = OPTION_METADATA_EXCLUDE
    # The valid option key values for this option.
    OPTION_METADATA_VALUES = [OPTION_METADATA_INCLUDE, OPTION_METADATA_EXCLUDE].freeze
  end
end
