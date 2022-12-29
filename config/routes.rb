Rails.application.routes.draw do
  resources :weddings
  resources :posts
  get 'image', to: 'posts#image'
  get 'finalimage', to: 'weddings#finalimage'
end
