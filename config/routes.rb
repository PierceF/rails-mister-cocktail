Rails.application.routes.draw do
  root to: "cocktails#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails, only: [:index, :new, :show, :create] do
    resources :doses

  end
  # resources :doses, only: :create
end
