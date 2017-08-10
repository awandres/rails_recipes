Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'recipes#index'



  get 'my_recipes', to: 'recipes#my_recipes'
  get 'shopping_list', to: 'ingredients#shopping_list'


  resources :recipes do
  resources :ingredients
end
  resources :schedules do
    resources :recipes
    member do
      get 'choose_recipe'
      delete 'remove_recipe'
      put 'add_recipe'
    end
  end

end
