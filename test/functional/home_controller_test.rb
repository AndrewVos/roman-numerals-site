require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end
  
  test "should convert decimals" do
    get :index, {'value' => '23'}
    assert_equal 'XXIII', assigns(:converted)
  end

  test "should convert roman numerals" do
    get :index, {'value' => 'XXIII'}
    assert_equal 23, assigns(:converted)
  end
end
