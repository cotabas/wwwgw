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
require "test_helper"

class MovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
