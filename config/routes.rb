Rails.application.routes.draw do
  root :to => 'pages#home'

  get '/tweets' => 'tweets#index'
  post '/searchtweets' => 'tweets#search'
end
