Hackd::Application.routes.draw do
   root 'events#index'

   scope :auth  do 
     get  ':provider/callback' => 'sessions#create'
     post ':provider/callback'=>  'sessions#create'
     get  'failure'           =>  'sessions#failure'
     post 'failure'           =>  'sessions#failure'
   end

   resources :events
end
