Rails.application.routes.draw do
  root to: 'quizzes#new'

  resources :quizzes, only: [:new, :create, :update, :show] do
  	resources :questions, only: [:index, :show] do
  		put "quizzes/:quiz_id/questions/:id/answer_question", to: 'questions#answer_question', as: :answer_question
  	end
  end
end
