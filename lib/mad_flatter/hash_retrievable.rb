# frozen_string_literal: true

module MadFlatter
  # Defines methods to retrieve model hash values dynamically.
  module HashRetrievable
    module_function

    # Returns the value of the hash using fully quaified hash names.
    def get_hash_value(hash:, hash_info:)
      hash.dig(*[hash_info[:dig], hash_info[:field_name]].flatten.compact)
    end
  end
end
