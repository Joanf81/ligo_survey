Rails.application.routes.draw do
	root to: 'quizzes#new'
  resources :quizzes, only: [:new, :create, :edit, :update, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
