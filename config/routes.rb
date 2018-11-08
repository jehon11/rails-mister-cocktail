Rails.application.routes.draw do
  resources :cocktails do
    resources :doses, except: :delete
  end
  delete 'cocktail/doses/:id', to: 'doses#destroy', as: :delete_dose
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
