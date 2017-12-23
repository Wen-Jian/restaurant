Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users,path:'',path_names: {sign_in:'login',sign_out:'logout',sign_up:'register'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  
  resources :restaurants do

    resources :blogs 

    collection do 

      get :search

    end

  end

  resources :comments

  resources :users, only: [:show]

  root "blogs#index"


  namespace :admin do

  	resources :restaurants

  	resources :blogs

  end	



end
