Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations',
                                    omniauth_callbacks: 'callbacks' }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end

  resources :posts do
    resources :comments
  end

  resources :memberships, only: [:index, :new, :show]

  scope module: 'memberships' do
    resources :groups, only: [:show]
  end

  root 'pages#index'
end
