class VisitorSerializer < ActiveModel::Serializer
  attributes :id, :username, :room_id, :token, :status
end
