Rails.application.routes.draw do
    root to: 'recipes#index'
    resources :recipes, only: [:index, :new, :create, :show]
    resources :kitchens, only: [:new, :create, :show]
end
