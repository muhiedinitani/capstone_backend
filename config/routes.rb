Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"
  get "/trips" => "trips#index"
  post "/trips" => "trips#create"
  post "/trips/:id" => "trips#show"
  get "/resorts" => "resorts#index"
  get "/resorts/:id" => "resorts#show"
  get "/nearby_resorts" => "resorts#nearby_resorts"
end
