Employee::Application.routes.draw do
  resources :reports  do
    get :date_report, :on=>:member
  end


  resources :districts

  resources :states

  resources :roles

  resources :users do
    get :profile, :on=>:member
    get :update_profile,:on=>:member
    put :profile_update,:on=>:member
    get :change_password,:on=>:member
    put :import,:on=>:collection
    get :upload,:on=>:collection
    get :approve, :on=>:member
    get :reset, :on=>:member
  end

  resources :user_sessions
  resources :homes

  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
  root :to => "user_sessions#new"


  # root :to => "welcome#index"
  match ':controller(/:action(/:id(.:format)))'
end
