Rails.application.routes.draw do

  get 'profesors/index'

  get 'profesors/show'

  get 'all_events/show' => 'all_events#show', :as => :all_events

  get 'single_event/new'

  get 'single_event/edit' => 'single_events#edit', :as => :edit_event

  get 'single_event/update'

  get 'single_event/index' => 'single_events#index', :as => :single_events

  get 'single_event/show' => 'single_events#show', :as => :event

  get 'mojegrupe/index' => 'mojegrupe#index', :as => :mojegrupe

  get 'mojegrupe/:id' => 'mojegrupe#show', :as => :grupa


  # get 'podaci/show'

  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords'}

  devise_scope :user do
    get "login", to: "devise/sessions#new"
    authenticated :user do
      root :to => 'home#show', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'users/sessions#new', as: :unauthenticated_root
    end

    root :to => redirect('devise/sessions#new')

  get "users/sign_out" => redirect("devise/sessions#new")

  get "/podaci" => 'podaci#show', :as => :podaci

  get "/home" => 'home#show', :as => :home

  ActiveAdmin.routes(self)
  get 'popis/show'

  get 'pages/show'

  get 'home/show'


  resources :pages, only: [:show]
  resources :mojegrupe
  resources :profesors
  resources :uceniks
  resources :users

  resources :single_events do
    get :get_events, on: :collection
    get :get_all_events, on: :collection
  end


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

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
end