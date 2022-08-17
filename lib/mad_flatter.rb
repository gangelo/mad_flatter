# frozen_string_literal: true

require 'active_support'
require_relative 'mad_flatter/version'

Dir[File.join('.', 'lib/mad_flatter/**/*.rb')].each do |f|
  require f
end
