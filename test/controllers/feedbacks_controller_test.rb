require 'test_helper'

class FeedbacksControllerTest < ActionDispatch::IntegrationTest
  def test_create__create_new_feedback_success_when_both_inputs_are_valid
    Feedback.destroy_all

    assert_difference 'Feedback.count', 1 do
      post api_feedbacks_path, params: {
        feedback: {
          user_name: 'user name',
          comment: 'comment'
        }
      }
    end
  end

  def test_create__create_new_feedback_fail_when_inputs_are_invalid
    Feedback.destroy_all

    assert_difference 'Feedback.count', 0 do
      post api_feedbacks_path, params: {
        feedback: {
          user_name: '',
          comment: nil
        }
      }
    end
  end
end
