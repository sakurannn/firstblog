Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
end

	root to: "blogs#index"
  resources :blogs, only: [:index, :show, :new, :create, :destroy, :edit, :update] do
  resources :comments, only: [:create]
   end
  resources :users, only: [:show]


end
