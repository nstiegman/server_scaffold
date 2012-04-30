ServerScaffold::Application.routes.draw do
  get "sessions/new"

  resources :histories do
    collection do
      get :destroy_all
    end
  end

  resources :devices
  
  resources :sessions, only: [:new, :create, :destroy]
  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  
  resources :locations do
    collection do
      get :newlocation
    end
    member do
      get :indoor
    end
    resources :lights do
      collection do
        get :newlight
      end
      member do
        get :dragdrop
      end
    end
  end

  resources :users

  root :to => "pages#home"

  match '/about',   :to => 'pages#about'

  match '/signup',  :to => 'users#new'
  
end

#== Route Map
# Generated on 30 Apr 2012 18:08
#
#    destroy_all_histories GET    /histories/destroy_all(.:format)                      {:action=>"destroy_all", :controller=>"histories"}
#                histories GET    /histories(.:format)                                  {:action=>"index", :controller=>"histories"}
#                          POST   /histories(.:format)                                  {:action=>"create", :controller=>"histories"}
#              new_history GET    /histories/new(.:format)                              {:action=>"new", :controller=>"histories"}
#             edit_history GET    /histories/:id/edit(.:format)                         {:action=>"edit", :controller=>"histories"}
#                  history GET    /histories/:id(.:format)                              {:action=>"show", :controller=>"histories"}
#                          PUT    /histories/:id(.:format)                              {:action=>"update", :controller=>"histories"}
#                          DELETE /histories/:id(.:format)                              {:action=>"destroy", :controller=>"histories"}
#                  devices GET    /devices(.:format)                                    {:action=>"index", :controller=>"devices"}
#                          POST   /devices(.:format)                                    {:action=>"create", :controller=>"devices"}
#               new_device GET    /devices/new(.:format)                                {:action=>"new", :controller=>"devices"}
#              edit_device GET    /devices/:id/edit(.:format)                           {:action=>"edit", :controller=>"devices"}
#                   device GET    /devices/:id(.:format)                                {:action=>"show", :controller=>"devices"}
#                          PUT    /devices/:id(.:format)                                {:action=>"update", :controller=>"devices"}
#                          DELETE /devices/:id(.:format)                                {:action=>"destroy", :controller=>"devices"}
#                 sessions POST   /sessions(.:format)                                   {:action=>"create", :controller=>"sessions"}
#              new_session GET    /sessions/new(.:format)                               {:action=>"new", :controller=>"sessions"}
#                  session DELETE /sessions/:id(.:format)                               {:action=>"destroy", :controller=>"sessions"}
#                   signup        /signup(.:format)                                     {:controller=>"users", :action=>"new"}
#                   signin        /signin(.:format)                                     {:controller=>"sessions", :action=>"new"}
#                  signout DELETE /signout(.:format)                                    {:controller=>"sessions", :action=>"destroy"}
#    newlocation_locations GET    /locations/newlocation(.:format)                      {:action=>"newlocation", :controller=>"locations"}
#          indoor_location GET    /locations/:id/indoor(.:format)                       {:action=>"indoor", :controller=>"locations"}
# newlight_location_lights GET    /locations/:location_id/lights/newlight(.:format)     {:action=>"newlight", :controller=>"lights"}
#  dragdrop_location_light GET    /locations/:location_id/lights/:id/dragdrop(.:format) {:action=>"dragdrop", :controller=>"lights"}
#          location_lights GET    /locations/:location_id/lights(.:format)              {:action=>"index", :controller=>"lights"}
#                          POST   /locations/:location_id/lights(.:format)              {:action=>"create", :controller=>"lights"}
#       new_location_light GET    /locations/:location_id/lights/new(.:format)          {:action=>"new", :controller=>"lights"}
#      edit_location_light GET    /locations/:location_id/lights/:id/edit(.:format)     {:action=>"edit", :controller=>"lights"}
#           location_light GET    /locations/:location_id/lights/:id(.:format)          {:action=>"show", :controller=>"lights"}
#                          PUT    /locations/:location_id/lights/:id(.:format)          {:action=>"update", :controller=>"lights"}
#                          DELETE /locations/:location_id/lights/:id(.:format)          {:action=>"destroy", :controller=>"lights"}
#                locations GET    /locations(.:format)                                  {:action=>"index", :controller=>"locations"}
#                          POST   /locations(.:format)                                  {:action=>"create", :controller=>"locations"}
#             new_location GET    /locations/new(.:format)                              {:action=>"new", :controller=>"locations"}
#            edit_location GET    /locations/:id/edit(.:format)                         {:action=>"edit", :controller=>"locations"}
#                 location GET    /locations/:id(.:format)                              {:action=>"show", :controller=>"locations"}
#                          PUT    /locations/:id(.:format)                              {:action=>"update", :controller=>"locations"}
#                          DELETE /locations/:id(.:format)                              {:action=>"destroy", :controller=>"locations"}
#                    users GET    /users(.:format)                                      {:action=>"index", :controller=>"users"}
#                          POST   /users(.:format)                                      {:action=>"create", :controller=>"users"}
#                 new_user GET    /users/new(.:format)                                  {:action=>"new", :controller=>"users"}
#                edit_user GET    /users/:id/edit(.:format)                             {:action=>"edit", :controller=>"users"}
#                     user GET    /users/:id(.:format)                                  {:action=>"show", :controller=>"users"}
#                          PUT    /users/:id(.:format)                                  {:action=>"update", :controller=>"users"}
#                          DELETE /users/:id(.:format)                                  {:action=>"destroy", :controller=>"users"}
#                     root        /(.:format)                                           {:controller=>"pages", :action=>"home"}
#                    about        /about(.:format)                                      {:controller=>"pages", :action=>"about"}
#                                 /signup(.:format)                                     {:controller=>"users", :action=>"new"}
