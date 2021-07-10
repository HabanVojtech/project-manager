Rails.application.routes.draw do
  resources :taged_tasks
  resources :tags
    devise_for :users
    devise_scope :user do
        authenticated :user do
            root 'projects#index', as: :authenticated_root
        end
        
        unauthenticated do
            root 'devise/sessions#new', as: :unauthenticated_root
        end
    end
    get "/search",to:"projects#search"
    resources :projects 
    resources :tasks
    resources :tags
    resources :taged_tasks
end
