Rails.application.routes.draw do
  resources :birthdays
  resources :weddings
  resources :posts
  get 'image', to: 'posts#image'
  get 'finalimage', to: 'weddings#finalimage'
  get 'finalimageb', to: 'birthdays#finalimageb'
end
