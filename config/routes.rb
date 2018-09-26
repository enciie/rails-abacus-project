Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #app homepage
  root to: "application#home"

  #Signup Page
  get '/signup' => 'users#new'

  #Routes for user login form, logging user in, and logging user out
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :users, only: [:create, :show, :edit, :update]
  resources :groups do
    resources :expenses
  end

end
