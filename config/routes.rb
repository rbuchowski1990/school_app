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

  post :subject_item_notes, to: 'students#create_new_subject_item_note'


  root 'visitors#index'
end
