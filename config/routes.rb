Rails.application.routes.draw do
  devise_for :users
  resources :questionnaires
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'single_pages#under_construction' 
end
