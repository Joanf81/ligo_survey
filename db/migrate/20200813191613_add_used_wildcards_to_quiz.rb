class AddUsedWildcardsToQuiz < ActiveRecord::Migration[6.0]
  def change
  	add_column :quizzes, :used_wildcards, :integer
  end
end
