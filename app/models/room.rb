class Room < ApplicationRecord
    belongs_to :owner
    has_many :visitors
    has_many :right_swipes
end
