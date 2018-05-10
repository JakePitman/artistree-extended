class Style < ApplicationRecord
    has_and_belongs_to_many :profiles
    has_many :prof_pictures
end
