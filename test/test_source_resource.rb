require 'test/unit'
require 'helper'
require 'webgen/source'

class TestSourceResource < Test::Unit::TestCase

  include Test::WebsiteHelper

  def test_initialize
    source = Webgen::Source::Resource.new('test-glob-*')
    assert_equal('test-glob-*', source.glob)
  end

  def test_paths
    @website.config['resources']['test-resource'] = ['Webgen::Source::FileSystem', File.dirname(__FILE__), File.basename(__FILE__)]
    source = Webgen::Source::Resource.new('test-*')
    assert_equal(1, source.paths.length)
    assert(source.paths.include?(Webgen::Path.new('/test_source_resource.rb')))
  end

end