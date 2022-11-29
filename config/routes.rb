Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  get '/dealerships', to: 'dealerships#index'
  get '/cars', to: 'cars#index'
end
