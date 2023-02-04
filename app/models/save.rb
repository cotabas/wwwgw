class Save < ApplicationRecord
  belongs_to :saved, class_name: "User"
  belongs_to :saved_movie, class_name: "Movie"
end
