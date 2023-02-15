Rails.application.routes.draw do
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,  skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  scope module: :public do
  resources :items, only: [:index, :show]
  resources :customers, only: [:show, :edit, :update]
  get 'customers/unsubscribe/:id' => 'customers#unsubscribe', as: 'confirm_unsubscribe'
  patch ':id/withdraw/:id' => 'customers#withdraw', as: 'withdraw_customer'
  put 'customers/withdraw/:id' => 'customers#withdraw'
  get 'customers/mypage' => 'customers#show'
  resources :orders, only: [:new, :comfirm, :complete, :create, :index, :show]
  get 'about' => 'homes#about'
  root to: 'homes#top'
  end

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions",
}
  namespace :admin do
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    root to: 'homes#top'
  end
end