Rails.application.routes.draw do
  # ユーザー用
  # URL /user/sign_in...
  devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  # 管理者用
  # URL /admin/sign_in...
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "public/posts#index"

  namespace :public do
    resources :posts
    resources :users
    resources :favorites
    resources :comments
  end
end

