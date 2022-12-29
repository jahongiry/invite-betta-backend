require "test_helper"

class WeddingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wedding = weddings(:one)
  end

  test "should get index" do
    get weddings_url, as: :json
    assert_response :success
  end

  test "should create wedding" do
    assert_difference("Wedding.count") do
      post weddings_url, params: { wedding: { card: @wedding.card, kelin: @wedding.kelin, kuyov: @wedding.kuyov, manzil: @wedding.manzil, sana: @wedding.sana, soat: @wedding.soat, tel: @wedding.tel } }, as: :json
    end

    assert_response :created
  end

  test "should show wedding" do
    get wedding_url(@wedding), as: :json
    assert_response :success
  end

  test "should update wedding" do
    patch wedding_url(@wedding), params: { wedding: { card: @wedding.card, kelin: @wedding.kelin, kuyov: @wedding.kuyov, manzil: @wedding.manzil, sana: @wedding.sana, soat: @wedding.soat, tel: @wedding.tel } }, as: :json
    assert_response :success
  end

  test "should destroy wedding" do
    assert_difference("Wedding.count", -1) do
      delete wedding_url(@wedding), as: :json
    end

    assert_response :no_content
  end
end
