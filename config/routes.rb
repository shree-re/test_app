Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
	authenticated :user do
	  root 'appointments#index', as: :authenticated_root
	end
    unauthenticated do
	  root 'devise/sessions#new', as: :unauthenticated_root
	end
  end

  resource :patients, only: [:create]
  resource :doctors, only: [:create]
  resource :appointments, only: [:create, :index]
end
