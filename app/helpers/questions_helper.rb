module QuestionsHelper
	def get_selected_answer
	    @quiz.get_selected_answer_for_question(@question)
	end

	def next_question_path
		quiz_question_path(@quiz, @question.next_question)
	end

	def previous_question_path
		quiz_question_path(@quiz, @question.prev_question)
	end

	def next?
		@question.next_question?
	end

	def prev?
		@question.prev_question?
	end

	def can_use_wildcard?
		@quiz.can_use_wildcard?
	end
end