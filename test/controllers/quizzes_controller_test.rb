require "test_helper"

class QuizzesControllerTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers

  test "should display index" do
    get quizzes_url
    assert_response :success
  end

  test "should show quiz" do
    sign_in users(:one)
    @one = quizzes(:one)
    get quiz_url(@one)
    assert_response :success
  end

  test "should redirect show to sign-in" do
    @one = quizzes(:one)
    get quiz_url(@one)
    assert_response :redirect
  end

  test "should create a new quiz" do
    sign_in users(:one)
    assert_difference("Quiz.count", +1) do
      post quizzes_url, params: { quiz: { title: "Test Title", description: "Test description." } }
    end
    assert_redirected_to quizzes_url
  end

end
