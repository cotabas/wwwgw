json.extract! movie, :id, :tmdb_id, :name, :info, :created_at, :updated_at
json.url movie_url(movie, format: :json)
