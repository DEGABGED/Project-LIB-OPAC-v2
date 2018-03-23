Rails.application.routes.draw do
  devise_for :users
  # HTML Pages routes
  resources :books
  root 'books#index'

  patch 'books/:id/borrow' => 'books#borrow', as: :borrow
  patch 'books/:id/return' => 'books#return', as: :return

  # JSON REST API routes
  namespace :api do
    resources :books

    patch 'books/:id/borrow' => 'books#borrow', as: :borrow
    patch 'books/:id/return' => 'books#return', as: :return
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# Author: Francis Zac dela Cruz
# This is a course requirement for CS 192 Software Engineering II under the supervision of Asst. Prof. Ma. Rowena C. Solamo of the Department of Computer Science, College of Engineering, University of the Philippines, Diliman for the AY 2017-2018.

# Code History:
# Francis Zac dela Cruz
# 02/23/18
# Sprint 2

# Comments
# 02/23/18
# Group 3
# Recoletas Chapel
#
##
