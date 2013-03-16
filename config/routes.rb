DiyProfile::Application.routes.draw do

  root :to => 'profile#index'

  get "profile" => "profile#index"
  get "profile/start"
  get "profile/stop"

  resources :tromples
  get "tromp" => "tromples#tromp"

end
