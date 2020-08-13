Rails.application.routes.draw do
  root to: 'quizzes#new'

  resources :quizzes, only: [:show, :new, :create], param: :id do
  	resources :questions, only: [:show]
  	put "questions/:id/answer_question", to: 'quizzes#answer_question', as: :answer_question
  	get :complete, to: 'quizzes#complete_quiz'
  	post "questions/:id/use_wildcard", to: 'questions#use_wildcard', as: :use_wildcard
  end
end
