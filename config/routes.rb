Rails.application.routes.draw do
  post 'hospital/:id/doctor', action: :create, controller: 'doctors'
  put 'hospital/:id/doctor/:docid', action: :update, controller: 'doctors'
  get 'hospital/:id/doctor', action: :list, controller: 'doctors' 
  delete 'hospital/:id/doctor/:docid', action: :delete, controller: 'doctors'
  post 'hospital' , action: :create, controller: 'hospital'
  put 'hospital/:id' , action: :update, controller: 'hospital'
  get 'hospital' , action: :list, controller: 'hospital'
  delete 'hospital/:id' , action: :delete, controller: 'hospital'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
