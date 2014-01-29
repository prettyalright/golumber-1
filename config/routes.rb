GoLumber::Application.routes.draw do

  root :to => 'products#search'
  match 'products/table' => 'products#table'
  match 'products/update_search_selects' => 'products#update_search_selects'
  resources :home
  resources :units
  resources :referrals
  resources :about, :only => [:index]
  resources :privacy, :only => [:index]
  resources :terms, :only => [:index]
  resources :faq, :only => [:index]
  resources :contacts, :only => [:index, :create]

  resources :companies
  resources :products
  resources :photos
  resources :mailing_lists
  resources :species, :only => [:index, :create, :new, :show, :destroy]
  resources :grades, :only => [:index, :create, :new, :show, :destroy]
  resources :employees
    
  devise_for :employees, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout', :passwords => 'devise/passwords', :sign_up => 'registration'}
  devise_for :employees, :controllers => {:confirmations => "confirmations", :registrations => "registrations"}
  devise_scope :employees do
    put "confirm_account", :to => "confirmations#confirm_account"
  end
 

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end