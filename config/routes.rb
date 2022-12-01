Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  get '/dealerships', to: 'dealerships#index'
  get '/cars', to: 'cars#index'
  get '/dealerships/new', to: 'dealerships#new'
  post '/dealerships', to: 'dealerships#create'
  get '/dealerships/:id', to: "dealerships#show"
  get '/cars/:id', to: "cars#show"
  get '/dealerships/:id/cars', to: "dealership_cars#index"
end
