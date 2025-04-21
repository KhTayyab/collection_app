Rails.application.routes.draw do
  root :to => 'collection_configrations#index'
  mount ShopifyApp::Engine, at: '/'
  resources :collection_configrations do
  	collection do
  		get :get_collection_images
  	end
  end
  resources :app_configrations, :except => [:edit, :update, :destroy, :show, :new, :create]
  resources :home, :except => [:edit, :update, :destroy, :show, :new, :create]  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
