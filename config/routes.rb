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
  get '/cars/:id', to: "cars#show"
  get '/dealerships/:id/cars', to: "dealership_cars#index"
end
