require 'test_helper'

class BirdsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get birds_new_url
    assert_response :success
  end

end
