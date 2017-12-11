Rails.application.routes.draw do
  devise_for :users,path:'',path_names: {sign_in:'login',sign_out:'logout',sign_up:'register'}
  resources :blogs
  root "restaurants#index"
  mount Commontator::Engine => '/commontator'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    root "restaurants#index"
    resources :restaurants
  end




end
