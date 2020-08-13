class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:answer_question]

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(quiz_params)

    respond_to do |format|
      if @quiz.save
        format.html { redirect_to quiz_questions_path(@quiz) }
      else
        format.html { render :new }
      end
    end
  end

  def answer_question
    respond_to do |format|
      format.json do 
        if @answer = Answer.find(answer_params[:id])
          if @quiz.answer_question(@answer)
            render json: {}, status: 201
          else
            render json: {error: "New answer couldn't be stored."}, status: 401
          end
        else
          render json: {error: "Selected answer doesn't exisit"}, status: 500
        end
      end
    end
  end

  private
    def set_quiz
      @quiz = Quiz.find(params[:quiz_id])
    end

    def quiz_params
      params.require(:quiz).permit(:user_name)
    end

    def answer_params
      params.require(:answer).permit(:id)
    end
end
