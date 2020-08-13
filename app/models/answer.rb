class Answer < ApplicationRecord
	belongs_to :question
	has_and_belongs_to_many :quizzes, class_name: 'Quiz', join_table: 'selected_answers',
                            foreign_key: 'quiz_id', association_foreign_key: 'answer_id'
    has_and_belongs_to_many :quizzes_discarted, class_name: 'Quiz', join_table: 'discarted_answers',
                            foreign_key: 'quiz_id', association_foreign_key: 'answer_id'
end
