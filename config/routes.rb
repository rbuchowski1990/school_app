Rails.application.routes.draw do
  resources :students do
    get :subjects
  end

  root 'students#index'
end
