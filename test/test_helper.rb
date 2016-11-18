$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'easy_cli'
require 'minitest/autorun'
require 'active_support'
require_relative 'support/stub_io'
