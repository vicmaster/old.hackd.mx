Hackd::Application.routes.draw do

  scope :auth  do
    get 'github/callback'=>  'sessions#create'
  end

  resources :sessions, only: [:create, :destroy]

  resources :events

  root to: 'events#index'
end
#== Route Map
# Generated on 16 Sep 2013 18:00
#
# github_callback GET    /auth/github/callback(.:format) sessions#create
#        sessions POST   /sessions(.:format)             sessions#create
#         session DELETE /sessions/:id(.:format)         sessions#destroy
#          events GET    /events(.:format)               events#index
#                 POST   /events(.:format)               events#create
#       new_event GET    /events/new(.:format)           events#new
#      edit_event GET    /events/:id/edit(.:format)      events#edit
#           event GET    /events/:id(.:format)           events#show
#                 PATCH  /events/:id(.:format)           events#update
#                 PUT    /events/:id(.:format)           events#update
#                 DELETE /events/:id(.:format)           events#destroy
#            root GET    /                               events#index
