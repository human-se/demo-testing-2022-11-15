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

  test "should display the new quiz form" do
    sign_in users(:one)
    get new_quiz_url
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

  test "should not create a new quiz and render the new form" do
    sign_in users(:one)
    assert_no_difference("Quiz.count") do
      post quizzes_url, params: { quiz: { title: "", description: "Test description." } }
    end
    assert_response 422
  end

  test "should display the edit form" do
    sign_in users(:one)
    q = quizzes(:one)
    get edit_quiz_url(q)
    assert_response :success
  end

  test "should not display the edit form for non-creator" do
    sign_in users(:two)
    q = quizzes(:one)
    get edit_quiz_url(q)
    assert_response :redirect
  end

end
