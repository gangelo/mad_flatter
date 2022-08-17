# frozen_string_literal: true

require_relative 'hash_informable'

module MadFlatter
  # Provides methods to load and return information about a given hash.
  module HashLoadable
    include HashInformable

    private

    def load_hash(hash, options)
      raise ArgumentError, "Argument hash is not a Hash (#{hash.class})" unless hash.is_a? Hash

      return {} if hash.blank?

      hash_info = load_hash_info(hash: hash, namespace: options.namespace)
      return hash_info if options.metadata?

      strip_metadata(hash_info)
    end

    def strip_metadata(hash)
      hash.transform_values do |metadata|
        metadata[:value]
      end
    end
  end
end
