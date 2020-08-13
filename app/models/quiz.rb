class Quiz < ApplicationRecord
	has_many :selected_answers, source: :answers
	has_and_belongs_to_many :selected_answers, class_name: 'Answer', join_table: 'selected_answers',
                            foreign_key: 'answer_id', association_foreign_key: 'quiz_id'

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
end