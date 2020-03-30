Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :inquiries, only:[:index, :new, :create]
  root 'inquiries#index'
 
 resources :answers, only:[:new, :create]
  
end
