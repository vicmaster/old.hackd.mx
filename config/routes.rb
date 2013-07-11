Hackd::Application.routes.draw do
   root 'events#index'
   resources :events
end
