class AddResultToQuiz < ActiveRecord::Migration[6.0]
  def change
  	add_column :quizzes, :result, :integer
  end
end
