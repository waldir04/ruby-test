Rails.application.routes.draw do
  get 'statistics/index'
  get 'content/index'
  root to: 'content#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
