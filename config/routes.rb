Rails.application.routes.draw do

  root "welcome#index"
  resources :posts do
    resources :comments, only:[:index, :create, :destroy]
  end

  resources :users, only: [:show, :new, :create, :edit, :update]
    get "users/:id/password" => "users#edit_password", as: :user_password
    patch "users/:id/password" => "users#update_password"

  resources :sessions, only:[:new, :create] do
    delete :destroy, on: :collection
  end

end
