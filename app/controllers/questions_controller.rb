class QuestionsController < ApplicationController
	before_action :set_quiz
	before_action :set_question, only: [:show, :answer_question]

	def index
		redirect_to quiz_question_path(quiz_id: @quiz.id, id: first_question.id)
	end

  def show; end

  def answer_question
    respond_to do |format|
      format.json do 
      	if @answer = Answer.find(answer_params[:id])
          if @quiz.answer_question(@answer)
      	    render json: {status: "ok"}
          else
            render json: {status: "error"}
          end
        else
          render json: {status: "erorr"}
        end
      end
    end
  end

  def get_selected_answer
    @quiz.get_selected_answer_for_question(@question)
  end
  helper_method :get_selected_answer

  private
    def set_quiz
    	@quiz = Quiz.find(params[:quiz_id])
    end

    def set_question
    	@question = Question.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:id)
    end

    def first_question
    	Question.first
    end
end
