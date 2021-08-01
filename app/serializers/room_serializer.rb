class RoomSerializer < ActiveModel::Serializer
  attributes :id, :visitors_joined, :owner_id, :token
  has_many :visitors
end
