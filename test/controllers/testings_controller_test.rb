require 'test_helper'

class TestingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @testing = testings(:one)
  end

  test "should get index" do
    get testings_url, as: :json
    assert_response :success
  end

  test "should create testing" do
    assert_difference('Testing.count') do
      post testings_url, params: { testing: { deskripsi: @testing.deskripsi, keterangan: @testing.keterangan } }, as: :json
    end

    assert_response 201
  end

  test "should show testing" do
    get testing_url(@testing), as: :json
    assert_response :success
  end

  test "should update testing" do
    patch testing_url(@testing), params: { testing: { deskripsi: @testing.deskripsi, keterangan: @testing.keterangan } }, as: :json
    assert_response 200
  end

  test "should destroy testing" do
    assert_difference('Testing.count', -1) do
      delete testing_url(@testing), as: :json
    end

    assert_response 204
  end
end
