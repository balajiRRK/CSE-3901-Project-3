Rails.application.routes.draw do
  root "home#index"
  devise_for :users, :path_prefix => "accounts"
  resources :users, :path_prefix => "admin" do
    member do
      get :destroy
    end
  end
  resources :graders, only: [:new, :create, :show, :index, :edit, :update, :destroy]
  resources :user_applications
  resources :courses do
    collection do
      post :wipe
    end
  end

  namespace :instructors do
    resources :recommendations, only: [:new, :create, :index, :show]
  end
  resources :sections
  resources :instructors
  resources :assistants
  resources :api_searches do
    member do
      # This is for the method download in the api_searches controller.
      # Will look into just using get instead of match because I think it will not be required for our use.
      post :download
      get :download
      post :reload
      get :reload
    end
  end

  

  namespace :admin do
    # Admin dashboard route
    get "dashboard", to: "dashboard#index", as: "dashboard"

    # Routes for user approvals
    # resources :users, only: [:index] do
    #   member do
    #     get 'user_actions'
    #     get 'user_review'
    #   end
    # end

    # get 'courses/reload', to: 'courses#reload', as: 'reload_courses'
    #new for loading the courses
    # post 'courses/load', to: 'courses#load', as: 'load_courses'
  end

  devise_scope :user do
    get "accounts/users/sign_out" => "devise/sessions#destroy"
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Catch-all route for handling 404 errors
  get "*path", to: "errors#404"
end
