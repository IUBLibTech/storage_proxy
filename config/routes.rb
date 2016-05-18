Rails.application.routes.draw do
  resources :stores, only: [:index, :show], param: :name do
    resources :files, controller: :media_files, only: [:index, :show]
  end

  resources :jobs, only: [:index, :show, :create, :destroy] do
    get 'output', to: 'jobs#output'
  end

  resources :caches, only: [:index, :show] do
    resources :files, controller: :cache_files, only: [:index, :show]
  end
end
