class Visitor < ApplicationRecord
    has_many :rooms
    has_many :owners, through: :rooms
end
