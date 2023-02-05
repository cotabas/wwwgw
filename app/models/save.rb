# == Schema Information
#
# Table name: saves
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Save < ApplicationRecord
  belongs_to :saved, class_name: "User"
  belongs_to :saved_movie, class_name: "Movie"
end
