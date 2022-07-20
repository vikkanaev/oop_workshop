# frozen_string_literal: true

RACK_ENV = ENV.fetch('RACK_ENV', 'test')

require 'bundler/setup'
Bundler.require(:default, :test, :development)

loader = Zeitwerk::Loader.new
loader.push_dir('lib')
loader.push_dir('spec/support')
loader.setup
