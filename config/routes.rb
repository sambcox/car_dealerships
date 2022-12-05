Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  get '/dealerships', to: 'dealerships#index'
  get '/cars', to: 'cars#index'
  get '/dealerships/new', to: 'dealerships#new'
  post '/dealerships', to: 'dealerships#create'
  get '/dealerships/:id/edit', to: 'dealerships#edit'
  patch '/dealerships/:id', to: 'dealerships#update'
  get '/dealerships/:id/cars/new', to: "cars#new"
  post '/dealerships/:id/cars', to: "cars#create"
  get '/dealerships/:id', to: "dealerships#show"
  delete '/dealerships/:id', to: 'dealerships#destroy'
  get '/cars/:id/edit', to: "cars#edit"
  patch 'cars/:id', to: "cars#update"
  get '/cars/:id', to: "cars#show"
  delete '/cars/:id', to: 'cars#destroy'
  delete '/dealerships/:dealership_id/cars/:car_id', to: 'dealership_cars#destroy'
  get '/dealerships/:id/cars', to: "dealership_cars#index"
  post '/dealerships/:id/cars', to: "dealership_cars#index"
end
