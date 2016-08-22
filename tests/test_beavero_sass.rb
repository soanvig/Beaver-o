require 'test/unit'
require 'beavero.rb'

class TestBeaveroSass < Test::Unit::TestCase
  def setup
    # Switch to test enviroment
    Dir.chdir('tests/test_enviroment')

    # Clean test enviroment
    FileUtils.rm_rf( Dir.glob( './*' ) )

    # Create test enviroment
    FileUtils.copy_entry('../test_enviroment_configuration', '.')

    # Run build
    Beavero.build
  end

  def teardown
    Dir.chdir('../..')
  end

  def test_build
    output = File.read('public/main.css')
    css = ".main{color:white}.import1{color:white}.import2{color:white}\n"
    assert_equal( output, css )
  end
end
