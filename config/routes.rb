Rails.application.routes.draw do
  devise_for :users
  resources :plans
  resources :customers
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :home, path: '/', only: :index do
    collection do
      get :home_1
      get :home_2
      get :service
      get :pricing_plan
      get :about_us
      get :gallery
      get :faq
      get :blog_1
      get :blog_2
      get :blog_single
      get :contact
    end
  end
  root 'home#index'
end
