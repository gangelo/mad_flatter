# frozen_string_literal: true

module MadFlatter
  # Flattens the provided Hash and assigns the results to the #hash_info
  # attribute. If a namespace is provided, the namespace is prepended to
  # the Hash key name.
  module HashInformable
    def load_hash_info(hash:, namespace: nil, dig: [], hash_info: {})
      hash.each do |key, value|
        if value.is_a? Hash
          load_hash_info(hash: value,
            namespace: namespace,
            dig: dig << key,
            hash_info: hash_info)
          dig.pop
        else
          assign_hash_info(hash_info: hash_info,
            key: key,
            value: value,
            namespace: namespace,
            dig: dig)
        end

        next
      end

      hash_info
    end

    private

    def assign_hash_info(hash_info:, key:, value:, namespace:, dig:)
      hash_key = [namespace, *dig, key].compact.join('_').to_sym

      hash_info[hash_key] = {
        value: value,
        metadata: {
          key: key,
          dig: dig.dup
        }
      }
    end
  end
end
