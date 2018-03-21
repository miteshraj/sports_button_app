Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/teams" => "teams#index"
  get "/teams/:id" => "teams#show"
  post "/users" => "users#create"
  get "/users" => "users#index"
  get "/users/:id" => "users#show"
end
