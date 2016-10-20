Rails.application.routes.draw do

  root "welcome#index"
  get 'auth/linkedin', as: :sign_in_with_linkedin
  get 'auth/linkedin/callback' => 'callbacks#linkedin'

  resources :posts do
    resources :comments, only:[:index, :create, :destroy]
  end

  resources :users, only: [:show, :new, :create, :edit, :update] do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]

  # UPDATE USER
  get "users/:id/password" => "users#edit_password", as: :user_password
  patch "users/:id/password" => "users#update_password"
  # UPDATE USER PROFILE
  get "users/:id/edit_profile" => "users#edit_profile", as: :user_profile
  patch "users/:id/edit_profile" => "users#update_profile"

  get "users/:id/edit_experience" => "users#edit_experience", as: :user_experience
  patch "users/:id/edit_experience" => "users#update_experience"

  get "users/:id/edit_project" => "users#edit_project", as: :user_project
  patch "users/:id/edit_project" => "users#update_project"

  get "users/:id/edit_opening" => "users#edit_opening", as: :user_opening
  patch "users/:id/edit_opening" => "users#update_opening"

  resources :sessions, only:[:new, :create] do
    delete :destroy, on: :collection
  end

end
