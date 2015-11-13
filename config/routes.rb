Rails.application.routes.draw do
    root to: 'user#index'
    get '/index', to: 'user#index', as: 'index'
    get '/register-user', to: 'user#register', as: 'user_register'
    post '/register-user', to: 'user#register', as: 'user_save'
    post '/signin', to: 'user#login', as: 'user_signin'
    get '/signup', to: 'user#logout', as: 'user_signup'
    get '/chat', to: 'chat#chat', as: 'user_chat'
    get '/chat/private/listuser', to: 'chat#listUser', as: 'private_chat'
    post '/ajax/insert_new_message', to: 'messenger#saveMess', as: 'ajax_insert_new_message'
    post '/ajax/find_message', to: 'messenger#findMessage', as: 'ajax_find_message'
    post '/ajax/create_chat_room', to: 'chat#createChatRoom', as: 'ajax_creat_chatroom'
    get '/ajax/get_chat_room_server', to: 'chat#getRoomServer', as: 'ajax_get_chatroom_server'
    post '/ajax/update_chat_room_server', to: 'chat#updateRoomServer', as: 'update_chat_room_server'
    post '/ajax/create_socket', to: 'user#createSocket', as: 'ajax_create_socket'
    post '/ajax/clear_socket', to: 'user#clearSocket', as: 'ajax_clear_socket'
    get '/chat/private', to: 'chat#privateRoom', as: 'private_chatroom'
  # The priority is based upon order of creation: first created -> highest priority.
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
