Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :studios
  resources :movies
  resources :actors
  resources :movie_actors
  # post '/movie_actors', to: 'movie_actors#create'
end
