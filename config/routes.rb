Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => {:registrations => "registrations"}
  	
  resources :users do      
    resources :book_lists do
      resources :listed_books
    end
  end
  resources :books do 
  	resources :reviews, except: [:index, :show]
  end

  root 'books#index', as: 'home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
