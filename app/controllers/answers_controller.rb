class AnswersController < ApplicationController

  # GET /answers/1
  # GET /answers/1.xml
  def vote
    @question = Question.answered.find(params[:question_id])
    @question.answer.vote!(request, request_hash, params[:vote] != nil) if @question
    redirect_to :back
  end

end
