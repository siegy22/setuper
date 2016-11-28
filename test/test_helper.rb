$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'setuper'
require 'minitest/autorun'
require 'active_support'
require_relative 'support/stub_io'
