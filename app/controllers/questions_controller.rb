class QuestionsController < ApplicationController
	before_action :set_quiz
	before_action :set_question, only: [:show, :answer_question]

	def index
		redirect_to quiz_question_path(quiz_id: @quiz.id, id: first_question.id)
	end

  def show; end

  private
    def set_quiz
    	@quiz = Quiz.find(params[:quiz_id])
    end

    def set_question
    	@question = Question.find(params[:id])
    end

    def first_question
    	Question.first
    end
end
