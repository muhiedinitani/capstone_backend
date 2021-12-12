Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"
  post "/trips" => "trips#create"
  get "/resorts" => "resorts#index"
  get "/resorts/:id" => "resorts#show"
  get "/nearby_resorts" => "resorts#nearby_resorts"
end
