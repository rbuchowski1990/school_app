Rails.application.routes.draw do
  devise_for :users
  resources :students do
    get :subjects
  end

  resources :teachers do
    get :subjects
  end

  get :report_subjects, to: 'reports#subjects'

  get :visitors, to: 'visitors#index'

  root 'visitors#index'
end
