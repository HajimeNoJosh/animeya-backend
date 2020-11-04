class Owner < ApplicationRecord
    has_many :rooms
    has_many :visitors, through: :rooms
end