class QuestionsController < ApplicationController
	before_action :set_quiz
	before_action :set_question, only: [:show]

	def index
		redirect_to quiz_question_path(quiz_id: @quiz.id, id: first_question.id)
	end

  # GET /quizzes/1
  # GET /quizzes/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
    	@quiz = Quiz.find(params[:quiz_id])
    end

    def set_question
    	@question = Question.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quiz_params
      params.require(:quiz).permit(:user_name)
    end

    def first_question
    	Question.first
    end
end
