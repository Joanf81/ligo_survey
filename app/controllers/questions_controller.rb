class QuestionsController < ApplicationController
  before_action :set_quiz
  before_action :set_question, only: [:show, :use_wildcard]

  def show 
    if @quiz.completed?
        redirect_to quiz_path(@quiz)
    end
  end

  def use_wildcard
    @quiz.use_wildcard(@question)
    redirect_to quiz_question_path(@quiz, @question)
  end

  private
    def set_quiz
    	@quiz = Quiz.find(params[:quiz_id])
    end

    def set_question
    	@question = Question.find(params[:id])
    end
end
