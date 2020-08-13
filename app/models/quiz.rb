class Quiz < ApplicationRecord
    MAX_WILDCARDS = 2

	has_many :selected_answers, source: :answers
	has_and_belongs_to_many :selected_answers, class_name: 'Answer', join_table: 'selected_answers',
                            foreign_key: 'answer_id', association_foreign_key: 'quiz_id'
    has_and_belongs_to_many :discarted_answers, class_name: 'Answer', join_table: 'discarted_answers',
                            foreign_key: 'answer_id', association_foreign_key: 'quiz_id'

    validates :used_wildcards, numericality: { less_than_or_equal_to: MAX_WILDCARDS }

    def get_selected_answer_for_question(question)
    	selected_answers.where(question_id: question.id).try(:first)
    end

    def answer_question(answer)
    	question = answer.question
    	previous_answer = get_selected_answer_for_question(question)

    	if selected_answers << answer
    		selected_answers.delete(previous_answer) if previous_answer
            true
    	else
    		false
    	end
    end

    def complete!
        unless completed?
            result = selected_answers.sum(:points)
            update_column(:result, result)
        end
    end

    def completed?
        !result.nil?
    end

    def use_wildcard(question)
        if can_use_wildcard?
            worst_answer = question.answers_for_quiz(self).order("points asc").first

            if discarted_answers << worst_answer
                update_column(:used_wildcards, used_wildcards + 1)
                true
            else
                false
            end
        end
    end

    def total_wildcards
        MAX_WILDCARDS - used_wildcards
    end

    def can_use_wildcard?
        total_wildcards > 0
    end
end