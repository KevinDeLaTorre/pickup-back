Rails.application.routes.draw do
  devise_for :users
  get 'users/new'
  scope 'api', as: 'api' do
    resources :events
    resources :users
  end
end
