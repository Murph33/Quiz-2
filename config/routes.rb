Rails.application.routes.draw do

  root "ideas#index"

  get "index" => "ideas#index"

  resources :users do
    resources :ideas
  end

  resources :sessions, only: [:new, :create, :destroy]

  resources :ideas, only: [] do
    resources :comments, only: [:create, :edit, :destroy]
    resources :joinings, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end

end
