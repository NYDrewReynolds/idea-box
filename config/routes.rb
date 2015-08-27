Rails.application.routes.draw do
  root 'ideas#index'
  resources :ideas

  post '/upvote', to: 'ideas#upvote'
  post '/downvote', to: 'ideas#downvote'
end
