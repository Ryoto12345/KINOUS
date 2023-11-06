Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :kinous do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end

  root 'setumei#top'

  get 'setumei/top' => 'setumei#top'
  get 'setumei/about' => 'setumei#about'
  get 'setumei/seibun' => 'setumei#seibun'
  get 'setumei/kouka' => 'setumei#kouka'

  
end
