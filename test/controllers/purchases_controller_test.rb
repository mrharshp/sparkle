require 'test_helper'

class PurchasesControllerTest < ActionDispatch::IntegrationTest
  test "should get buy" do
    get purchases_buy_url
    assert_response :success
  end

end
