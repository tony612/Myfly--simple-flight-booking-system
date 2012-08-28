require 'test_helper'

class DeliverPaysControllerTest < ActionController::TestCase
  setup do
    @deliver_pay = deliver_pays(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deliver_pays)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create deliver_pay" do
    assert_difference('DeliverPay.count') do
      post :create, deliver_pay: { address_id: @deliver_pay.address_id, deliver_way: @deliver_pay.deliver_way, order_id: @deliver_pay.order_id, pay_way: @deliver_pay.pay_way, remark: @deliver_pay.remark }
    end

    assert_redirected_to deliver_pay_path(assigns(:deliver_pay))
  end

  test "should show deliver_pay" do
    get :show, id: @deliver_pay
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @deliver_pay
    assert_response :success
  end

  test "should update deliver_pay" do
    put :update, id: @deliver_pay, deliver_pay: { address_id: @deliver_pay.address_id, deliver_way: @deliver_pay.deliver_way, order_id: @deliver_pay.order_id, pay_way: @deliver_pay.pay_way, remark: @deliver_pay.remark }
    assert_redirected_to deliver_pay_path(assigns(:deliver_pay))
  end

  test "should destroy deliver_pay" do
    assert_difference('DeliverPay.count', -1) do
      delete :destroy, id: @deliver_pay
    end

    assert_redirected_to deliver_pays_path
  end
end
