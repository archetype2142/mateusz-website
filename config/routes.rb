Rails.application.routes.draw do
  resources :static_pages, only: [] do
    collection do
      get 'privacy-policy', to: "privacy_policy"
    end
  end

  scope '(:locale)', module: "spina", locale: /en|pl/ do
    Spina::Engine.routes.draw do
      namespace :admin, path: Spina.config.backend_path do
        resources :form_submissions, only: [:index, :show]
      end
    end

    mount Spina::Engine => "/"

    get '/about', to: 'pages#about', as: :about
    post '/contact', to: 'contacts#create', as: :contact
    post '/newsletter', to: 'newsletters#create', as: :newsletter_signup
  end

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
