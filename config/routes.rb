Blacklight::Application.routes.draw do

  Blacklight::Marc.add_routes(self)
  root to: "catalog#index"
  blacklight_for :catalog
  devise_for :users

  # get 'lib/:inst', to: redirect('/?q=&f[inst_z][]=%{inst}')
  get '/ecl', to: redirect('/?q=&f[inst_z][]=ecl')
  get '/emc', to: redirect('/?q=&f[inst_z][]=emc')
  get '/epi', to: redirect('/?q=&f[inst_z][]=epi')
  get '/flo', to: redirect('/?q=&f[inst_z][]=flo')
  get '/les', to: redirect('/?q=&f[inst_z][]=les')
  get '/luc', to: redirect('/?q=&f[inst_z][]=luc')
  get '/mca', to: redirect('/?q=&f[inst_z][]=mca')
  get '/mcp', to: redirect('/?q=&f[inst_z][]=mcp')
  get '/mcw', to: redirect('/?q=&f[inst_z][]=mcw')
  get '/mfa', to: redirect('/?q=&f[inst_z][]=mfa')
  get '/naf', to: redirect('/?q=&f[inst_z][]=naf')
  get '/nas', to: redirect('/?q=&f[inst_z][]=nas')
  get '/nco', to: redirect('/?q=&f[inst_z][]=nco')
  get '/wen', to: redirect('/?q=&f[inst_z][]=wen')
  get '/whe', to: redirect('/?q=&f[inst_z][]=whe')

  # get 'reserves', to: redirect('/?q=&f[doctype][]=cres')
  # get 'reserves/:inst', to: redirect('/?q=&f[doctype][]=cres&f[inst_z][]=%{inst}')

  # get 'reserves' => '/reserves.html'
  # get 'reserves/:id' => 'catalog#purchase', as: :purchase

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
