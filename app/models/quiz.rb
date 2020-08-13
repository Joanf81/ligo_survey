class Quiz < ApplicationRecord
	has_many :selected_answers, source: :answers
	has_and_belongs_to_many :selected_answers, class_name: 'Answer', join_table: 'selected_answers',
                            foreign_key: 'answer_id', association_foreign_key: 'quiz_id'

end