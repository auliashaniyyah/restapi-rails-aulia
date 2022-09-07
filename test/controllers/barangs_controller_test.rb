require 'test_helper'

class BarangsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @barang = barangs(:one)
  end

  test "should get index" do
    get barangs_url, as: :json
    assert_response :success
  end

  test "should create barang" do
    assert_difference('Barang.count') do
      post barangs_url, params: { barang: { deskripsi: @barang.deskripsi, jumlah: @barang.jumlah } }, as: :json
    end

    assert_response 201
  end

  test "should show barang" do
    get barang_url(@barang), as: :json
    assert_response :success
  end

  test "should update barang" do
    patch barang_url(@barang), params: { barang: { deskripsi: @barang.deskripsi, jumlah: @barang.jumlah } }, as: :json
    assert_response 200
  end

  test "should destroy barang" do
    assert_difference('Barang.count', -1) do
      delete barang_url(@barang), as: :json
    end

    assert_response 204
  end
end
