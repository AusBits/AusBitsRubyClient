require 'helper'

class TestConfig < Minitest::Test

  def test_get_ausbitsrc
    path = File.expand_path '../../fixtures/ausbitsrc', __FILE__
    access_key, secret_key = ausbitsAPI::Config.get_ausbitsrc(path)
    assert_equal 'access1234567', access_key
    assert_equal 'secret1234567', secret_key
  end

end
