class CreateSelectedAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :selected_answers, id: false do |t|
      t.belongs_to :quiz, index: true
      t.belongs_to :answer, index: true

      t.timestamps
    end
  end
end
