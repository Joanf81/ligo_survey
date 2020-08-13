class Question < ApplicationRecord
	has_many :answers

	def answers_for_quiz(quiz)
	    answers.where.not(id: quiz.discarted_answers.map(&:id))
	end

	def next_question
	    @next_question ||= Question.where("id > ?", id).try(:first)
	end

	def prev_question
	    @prev_question ||= Question.where("id < ?", id).try(:last)
	end

	def next_question?
		!next_question.nil?
	end

	def prev_question?
		!prev_question.nil?
	end
end
