Rails.application.routes.draw do
  root to: 'quizzes#new'

  resources :quizzes, only: [:new, :create] do
  	resources :questions, only: [:index, :show]
  	put "questions/:id/answer_question", to: 'quizzes#answer_question', as: :answer_question
  end
end
