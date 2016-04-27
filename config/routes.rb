Rails.application.routes.draw do

  namespace :storage_api do
    # Limit stores and nested media_files to GET index and show
    scope '/stores' do
      get '/' => 'stores#index'
      scope '/:store_name' do
        get '/' => 'stores#show'
        scope '/media_files' do
          get '/' => 'media_files#index'
          scope '/:media_file_name' do
            get '/' => 'media_files#show', :constraints => { :media_file_name => /.*/ }
          end
        end
      end
    end
    # Limit media_files to GET index and show
    scope '/media_files' do
      get '/' => 'media_files#index'
      scope '/:media_file_name' do
        get '/' => 'media_files#show', :constraints => { :media_file_name => /.*/ }
      end
    end
    # Limit jobs to POST, GET index and show
    scope '/jobs' do
      get '/' => 'jobs#index'
      post '/' => 'jobs#create'
      post '/:cache_name/:cache_file_name' => 'jobs#create', :constraints => { :cache_file_name => /.*/ }
      scope '/:id' do
        get '/' => 'jobs#show'
      end
    end
    # Limit caches and nested media_files to GET index and show
    scope '/caches' do
      get '/' => 'caches#index'
      scope '/:cache_name' do
        get '/' => 'caches#show'
        scope '/cache_files' do
          get '/' => 'cache_files#index'
          scope '/:cache_file_name' do
            get '/' => 'cache_files#show', :constraints => { :cache_file_name => /.*/ }
          end
        end
      end
    end
  end

  # These function outside of the storage_api so we can easily create objects through
  # regular Rails views to test api routes above.
  resources :works
  resources :caches
  resources :stores
  resources :media_files
  resources :cache_files

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
