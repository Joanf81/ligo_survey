Rails.application.routes.draw do
	root to: 'quizzes#new'
  resources :quizzes, only: [:new, :create, :update, :show] do
  	resources :questions, only: [:index, :show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
