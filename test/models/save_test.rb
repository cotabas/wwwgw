# == Schema Information
#
# Table name: saves
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#  movie_id   :bigint           not null
#
require "test_helper"

class SaveTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
