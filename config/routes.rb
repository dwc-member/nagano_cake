Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # 会員側のルーティング設定
  get 'items' => 'public/items#index'
  root to: 'public/homes#top'
  # 管理者側のルーティング設定
  namespace :admin do
    resources :items, only: [:new, :create, :index, :show]
    get '/' => 'homes#top'
  end
end
