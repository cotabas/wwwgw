class Movie < ApplicationRecord
  has_many :movies_saved, foreign_key: :saved_movie_id
  has_many :saves, through: :movies_saved, source: :saved
end
