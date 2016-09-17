Rails.application.routes.draw do

  root "posts#index"
  resources :posts do
    resources :comments, only:[:index, :create, :destroy]
  end

  resources :users, only:[:new, :create]

  resources :sessions, only:[:new, :create] do
    delete :destroy, on: :collection
  end

end
