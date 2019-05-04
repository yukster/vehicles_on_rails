# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # for Devise - need to create this!
  root to: 'home#index'
end
