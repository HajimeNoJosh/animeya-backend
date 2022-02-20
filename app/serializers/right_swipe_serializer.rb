class RightSwipeSerializer < ActiveModel::Serializer
  attributes :id, :room_id, :user_token, :anime_id, :score, :anime_title, :image
end
