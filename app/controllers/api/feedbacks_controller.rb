module Api
  class FeedbacksController < ApplicationController
    def create
      @feedback = Feedback.new(feedback_params)
      @feedback.valid?
      render json: { success: false, error: @feedback.errors.messages }, status: :unprocessable_entity unless @feedback.save
    end

    private

    def feedback_params
      params.require(:feedback).permit(:user_name, :comment)
    end
  end
end
