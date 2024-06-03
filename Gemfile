# frozen_string_literal: true

source 'https://rubygems.org'

# Specify your gem's dependencies in mad_flatter.gemspec
gemspec

gem 'bundler', '~> 2.5', '>= 2.5.3'
gem 'rake', '~> 13.1'

group :development do
  gem 'reek', '~> 6.1', '>= 6.1.1'
  gem 'rubocop', '>= 1.31', '< 2.0'
  gem 'rubocop-performance', '~> 1.21'
  gem 'rubocop-rspec', '~> 2.30'
end

group :test do
  gem 'rspec', '>= 3.12', '< 4.0'
  gem 'simplecov', '~> 0.22.0'
end

group :development, :test do
  gem 'pry-byebug', '~> 3.10', '>= 3.10.1'
end
