class RoomsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        rooms = Room.all.select(:id, :token, :visitors_joined, :owner_id)
        render json:  rooms
    end

    def create
        token = SecureRandom.alphanumeric
        Room.create(token: token, owner_id: 2)
    end
end