Rails.application.routes.draw do
 devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
 }

 devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
 }
  get '/' => 'public/homes#top'
  get '/about' => 'public/homes#about'
  get 'customers/confirm' => 'public/customers#confirm'
  delete 'cart_items/destroy_all' => 'public/cart_items#destroy_all'
  post 'orders/confirm' => 'public/orders#confirm'
  get 'orders/conpletion' => 'public/orders#conpletion'

 namespace :public do
  resources :homes
  resources :items
  resources :registrations
  resources :sessions
  resources :customers
  resources :cart_items
  resources :orders
  resources :addresses
 end
 namespace :admin do
  resources :sessions
  resources :genres
  resources :items
  resources :customers
  resources :homes
  resources :orders
  resources :orders_details
 end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
