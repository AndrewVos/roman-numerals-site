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

  test "should not show a 'post on twitter' link if nothing has been converted" do
    get :index, {'value' => '23'}
    assert_select ['a', false], :text => 'Share your results on Twitter!'
  end

  test "should show a 'post on twitter' link" do
    get :index, {'value' => '23'}
    assert_select 'a', :text => 'Share your results on Twitter!'
  end

  test "should set an error message if the value can't be converted" do
    get :index, {'value' => 'this will fail'}
    assert_equal "Please enter a valid value", flash[:error]
  end

  test "should set the converted value to nil if the value can't be converted" do
    get :index, {'value' => 'this will fail'}
    assert_equal nil, assigns(:converted)
  end

  test "should show a error message if the value can't be converted" do
    get :index, {'value' => 'this will fail'}
    assert_select('div[class="error"]')
  end

  test "should not show an error message of the value can be converted" do
    get :index, {'value' => '12'}
    assert_select('div[class="error"]', false)
  end
end
