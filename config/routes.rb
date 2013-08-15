Hackd::Application.routes.draw do

   scope :auth  do 
     get 'github/callback'=>  'sessions#create'
   end

   resources :sessions, only: [:create, :destroy]

   resources :events

   root to: 'events#index'
end
