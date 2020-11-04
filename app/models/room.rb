class Room < ApplicationRecord
    belongs_to :owner
    has_many :visitors
end
