# frozen_string_literal: true

RACK_ENV = ENV.fetch('RACK_ENV', 'development')

require 'bundler/setup'
Bundler.require(:default, RACK_ENV)

loader = Zeitwerk::Loader.new
loader.push_dir('lib')
loader.setup

Dotenv.load
