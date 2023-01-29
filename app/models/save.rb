class Save < ApplicationRecord
  belongs_to :user, class_name: "User"
  belongs_to :saved_movie, class_name: "Movie"
end
