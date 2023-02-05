# == Schema Information
#
# Table name: movies
#
#  id         :bigint           not null, primary key
#  tmdb_id    :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  poster     :string
#  release    :string
#  imdb       :integer
#  runtime    :integer
#
class Movie < ApplicationRecord
  has_many :movies_saved, foreign_key: :saved_movie_id
  has_many :saves, through: :movies_saved, source: :saved
end
