Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/new' => 'games#new'
  post '/score' => 'games#score'
end
