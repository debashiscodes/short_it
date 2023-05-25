Rails.application.routes.draw do
  root to: 'urls#index'

  post '/urls' => 'urls#create'
end
