module QuestionsHelper
	def get_selected_answer
    @quiz.get_selected_answer_for_question(@question)
  end
end