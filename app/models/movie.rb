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
  has_many :saves, class_name: 'Save'
  has_many :users, through: :saves
end
