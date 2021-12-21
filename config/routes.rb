Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post "/users" => "users#create"
  get "/users/:id" => "users#show"
  post "/sessions" => "sessions#create"
  get "/trips" => "trips#index"
  post "/trips" => "trips#create"
  get "/trips/:id" => "trips#show"
  get "/resorts" => "resorts#index"
  get "/resorts/:id" => "resorts#show"
  get "/nearby_resorts" => "resorts#nearby_resorts"
  get "/get_location" => "resorts#get_location"
  get "/nearby_search" => "resorts#nearby_search"
end
