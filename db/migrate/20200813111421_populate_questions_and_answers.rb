class PopulateQuestionsAndAnswers < ActiveRecord::Migration[6.0]
  def change
  	add_column :answers, :points, :integer

	survey.each do |survey|
		q = Question.create(question: survey[:q])
		survey[:a].each do |answer, points|
			Answer.create(question_id: q, answer: answer, points: points)
		end
	end
  end

  private
  def survey
  	[
		{q: "What is your favorite versioning tool?",
		 a: [["SVN", 0],
		 	 ["GIT", 10],
		 	 ["CVS", -5],
		 	 ["Mercurial", 5],
		 	 ["Ehh, what?", 0]
			]
		},
		{q: "What is your favorite cat?",
		 a: [["Ceiling cat", 10],
		 	 ["Invisible bike cat", 5],
		 	 ["Octocat", 12],
		 	 ["Monorail cat", 2]
			]
		},
		{q: "What is your favorite gemstone?",
		 a: [["Diamond", 5],
		 	 ["Ruby", 10],
		 	 ["Kryptonite", 10],
		 	 ["Emerald", -5]
			]
		}
	]
  end
end
