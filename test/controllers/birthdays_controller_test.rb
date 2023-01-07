require "test_helper"

class BirthdaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @birthday = birthdays(:one)
  end

  test "should get index" do
    get birthdays_url, as: :json
    assert_response :success
  end

  test "should create birthday" do
    assert_difference("Birthday.count") do
      post birthdays_url, params: { birthday: { card: @birthday.card, manzil: @birthday.manzil, mehmon: @birthday.mehmon, mezbon: @birthday.mezbon, sana: @birthday.sana, soat: @birthday.soat, tel: @birthday.tel } }, as: :json
    end

    assert_response :created
  end

  test "should show birthday" do
    get birthday_url(@birthday), as: :json
    assert_response :success
  end

  test "should update birthday" do
    patch birthday_url(@birthday), params: { birthday: { card: @birthday.card, manzil: @birthday.manzil, mehmon: @birthday.mehmon, mezbon: @birthday.mezbon, sana: @birthday.sana, soat: @birthday.soat, tel: @birthday.tel } }, as: :json
    assert_response :success
  end

  test "should destroy birthday" do
    assert_difference("Birthday.count", -1) do
      delete birthday_url(@birthday), as: :json
    end

    assert_response :no_content
  end
end
