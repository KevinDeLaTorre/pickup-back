Rails.application.routes.draw do
  scope 'api', as: 'api' do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {registrations: 'auth/registrations'}
    resources :events
    resources :users
  end
end
