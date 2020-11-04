class Room < ApplicationRecord
    belongs_to :owner
    belongs_to :visitor
end
