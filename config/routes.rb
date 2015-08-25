Rails.application.routes.draw do
  root 'ideas#new'
  resources :ideas

  namespace :api do
    namespace :v1 do
      post   'add_idea',    to: 'idea#add_idea'
      delete 'remove_idea', to: 'idea#remove_idea'
    end
  end
end
