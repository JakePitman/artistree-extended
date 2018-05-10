class ProfPicture < ApplicationRecord
  include ImageUploader[:image]
  belongs_to :profile
  belongs_to :style
end
