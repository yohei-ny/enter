Rails.application.routes.draw do
  resources :class_tasks
  namespace :public do
     resource :users, only: [:show]
     resources :class_tasks,only: [:index,:show]
     resources :centers,only: [:create,:update,:destory]
       post "centers/all_up", to: "centers#all_up",as: "all_up"
  end
  # devise_for :admin_users
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  namespace :admin do
      devise_for :admin_users, controllers: {
      sessions: 'admin/admin_users/sessions',
      registrations: 'admin/admin_users/registrations',
      passwords: 'admin/admin_users/passwords'
    }
  end


    scope module: 'public' do
    devise_for :users, controllers: {
      sessions: 'public/users/sessions',
      registrations: 'public/users/registrations',
      passwords: 'public/users/passwords'
    }
  end
end