Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
      resources :jobs do
        member do
          post :publish
          post :hide

        end
        resources :resumes
      end
    end

#//---------定制devise的注册，增加注册的user栏，之后创建controller
    namespace :account do
  resources :users
end
#//----------------


    resources :jobs do
     resources :resumes
   end
   root 'welcome#index'
end
