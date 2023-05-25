Rails.application.routes.draw do
  root to: 'urls#index'

  post '/urls' => 'urls#create'
  get '/urls/:id' => 'urls#show',  :as => 'show_routes'
end
