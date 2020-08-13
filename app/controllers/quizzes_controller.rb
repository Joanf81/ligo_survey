class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show, :answer_question, :complete_quiz]

  def show
    unless @quiz.completed?
      redirect_to quiz_question_path(@quiz, first_question)
    end
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(quiz_params.merge(used_wildcards: 0))

    respond_to do |format|
      if @quiz.save
        format.html { redirect_to quiz_path(@quiz) }
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

  def complete_quiz
    @quiz.complete!
    redirect_to quiz_path(@quiz)
  end

  private
    def set_quiz
      @quiz = Quiz.find(params[:quiz_id] || params[:id])
    end

    def quiz_params
      params.require(:quiz).permit(:user_name)
    end

    def answer_params
      params.require(:answer).permit(:id)
    end

    def first_question
      Question.first
    end
end
