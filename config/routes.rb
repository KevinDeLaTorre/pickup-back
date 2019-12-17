Rails.application.routes.draw do
  scope 'api', as: 'api' do
    resources :events
  end
end
