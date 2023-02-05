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
class Save < ApplicationRecord
  belongs_to :user 
  belongs_to :movie
end
