Hackd::Application.routes.draw do
   root 'events#index'
   # get '/auth/:provider/callback', to: 'sessions#create'
   get '/auth/:provider/callback', :to => 'sessions#create'
   get '/auth/failure', :to => 'sessions#failure'
   post '/auth/:provider/callback', :to => 'sessions#create'
   post '/auth/failure', :to => 'sessions#failure'

   resources :events
end
