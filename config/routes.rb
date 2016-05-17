Rails.application.routes.draw do
  resources :stores, only: [:index, :show] do
    resources :files, controller: :media_files, only: [:index, :show]
    get 'search', to: 'stores#search'
  end

  resources :jobs, only: [:index, :show, :create] do
    get 'output', to: 'jobs#output'
  end

  resources :caches, only: [:index, :show] do
    resources :files, controller: :cache_files, only: [:index, :show]
  end
end
