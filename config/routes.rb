Rails.application.routes.draw do
  resources :payments
  resources :offline_payment_histories
  resources :offline_payments
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
      post :create
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
  match '/payu_callback' => 'customers#payu_return', :via => [:get, :post], :as => 'payments_payu_return'
  root 'home#index'
end
