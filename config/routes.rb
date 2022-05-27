Rails.application.routes.draw do
  post 'bookings/create'
  put 'bookings/update'
  get 'bookings/list'
  delete 'bookings/delete'
  post 'doctors/create'
  put 'doctors/update'
  get 'doctors/list'
  delete 'doctors/delete'
  post 'hospital'
  put 'hospital'
  get 'hospital'
  delete 'hospital'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
