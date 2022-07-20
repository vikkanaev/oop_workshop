# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'faraday'
gem 'pry-byebug', platform: :mri
gem 'zeitwerk'
gem 'activesupport', require: 'active_support/all'
gem 'dotenv'

group :development, :test do
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rspec', require: false
end

group :test do
  gem 'rspec'
  gem 'rspec-its'
end
