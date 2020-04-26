Rails.application.routes.draw do

 root to: 'items#top'
        post 'order/confirm' => 'orders#confirm'
        get 'orders/thanks' => 'orders#thanks'
        delete 'cart_items/destroy_all' => 'cart_items#destroy_all'

    devise_for :admins, controllers: {
          sessions: 'admins/sessions'
        }
    namespace :admins do
        get '/' => 'admins#top'
        resources :climbers, only: [:show,:index,:edit, :update]
        resources :order_items, only: [:update]
        resources :orders, only: [:index, :show, :update]
        resources :genres, only: [:create, :index, :edit, :update, :destroy]
        resources :items, only: [:create, :index, :destroy, :new, :show, :edit, :update]
    end

    devise_for :climbers, controllers: {
          sessions: 'climbers/sessions',
          registrations: 'climbers/registrations',
          passwords: 'climbers/passwords'
        }
    namespace :climbers do
        get 'confirm' => 'climbers#confirm'
        patch 'hide' => 'climbers#hide'
        put 'hide' => 'climbers#hide'
    end

    scope module: :climbers do
        resources :climbers, only: [:show, :edit, :update]
    end

        resources :items, only: [:index, :show]
        resources :ships, only: [:index, :edit, :destroy, :update, :create ]
        resources :orders, only: [:new, :create, :index, :show]
        resources :cart_items, only: [:index,:create,:destroy,:update]
        resources :jims, only: [:index, :show]
end
