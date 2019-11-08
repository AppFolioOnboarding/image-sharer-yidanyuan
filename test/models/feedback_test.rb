require 'test_helper'

class FeedbackTest < ActiveSupport::TestCase
  def test_feedback__valid_record_only_both_user_name_and_comment_are_not_nil
    feedback = Feedback.new(user_name: 'yidan', comment: 'test comment')
    assert_predicate feedback, :valid?
  end

  def test_feedback__invalid_record_if_user_name_is_not_valid
    feedback = Feedback.new(user_name: nil, comment: 'test comment')
    assert_not feedback.valid?
  end

  def test_feedback__invalid_record_if_comment_is_not_valid
    feedback = Feedback.new(user_name: 'some name', comment: '')
    assert_not feedback.valid?
  end
end
