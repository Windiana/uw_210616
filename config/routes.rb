Rails.application.routes.draw do

  root to: "zip_codes#index"

  resources :zip_codes do
    collection do
      post :search
    end
  end
end
