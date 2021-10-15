Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  get 'similar_movies/:title', to: 'movies#movies_same_director', as: :director_same_movies
end
