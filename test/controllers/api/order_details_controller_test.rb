require 'test_helper'

class Api::OrderDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_order_detail = api_order_details(:one)
  end

  test "should get index" do
    get api_order_details_url, as: :json
    assert_response :success
  end

  test "should create api_order_detail" do
    assert_difference('Api::OrderDetail.count') do
      post api_order_details_url, params: { api_order_detail: { order: @api_order_detail.order, price: @api_order_detail.price, product: @api_order_detail.product, qty: @api_order_detail.qty } }, as: :json
    end

    assert_response 201
  end

  test "should show api_order_detail" do
    get api_order_detail_url(@api_order_detail), as: :json
    assert_response :success
  end

  test "should update api_order_detail" do
    patch api_order_detail_url(@api_order_detail), params: { api_order_detail: { order: @api_order_detail.order, price: @api_order_detail.price, product: @api_order_detail.product, qty: @api_order_detail.qty } }, as: :json
    assert_response 200
  end

  test "should destroy api_order_detail" do
    assert_difference('Api::OrderDetail.count', -1) do
      delete api_order_detail_url(@api_order_detail), as: :json
    end

    assert_response 204
  end
end
