class Review < ApplicationRecord
    has_one_attached :image
    belongs_to :game
end

