Rails.application.routes.draw do
  # HTML Pages routes
  resources :books

  # JSON REST API routes
  namespace :api do
    resources :books

    patch 'books/:id/borrow' => 'books#borrow', as: :borrow
    patch 'books/:id/return' => 'books#return', as: :return
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
