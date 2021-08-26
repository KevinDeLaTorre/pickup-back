Rails.application.routes.draw do
  get 'users/new'
  scope 'api', as: 'api' do
    resources :events
    resources :users
  end
end
