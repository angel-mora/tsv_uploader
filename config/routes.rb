Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :reports do
      collection do
        post :import
      end
    end
  end
  root to: "users#index"
end
