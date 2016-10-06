Rails.application.routes.draw do

  root "welcome#index"
  get 'auth/linkedin', as: :sign_in_with_linkedin
  get 'auth/linkedin/callback' => 'callbacks#linkedin'

  resources :posts do
    resources :comments, only:[:index, :create, :destroy]
  end

  resources :users, only: [:show, :new, :create, :edit, :update]
    # UPDATE USER
    get "users/:id/password" => "users#edit_password", as: :user_password
    patch "users/:id/password" => "users#update_password"

  resources :sessions, only:[:new, :create] do
    delete :destroy, on: :collection
  end

end
