Rails.application.routes.draw do
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :buckets, only: [:index, :create, :update] do
    resources :tasks, only: [:index, :create] do
      collection do
        get :pending
      end
    end
  end

  resources :tasks, only: [] do
    member do
      post :complete
    end
    
  end
end
