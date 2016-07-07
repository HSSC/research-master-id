Rails.application.routes.draw do
  devise_for :users
  root 'protocols#index'

  resources :research_masters

  resources :protocols do
    collection do
      match 'search' => 'protocols#search', via: [:get, :post], as: :search
    end
  end

  resources :pi_names, only: [:index]
end
