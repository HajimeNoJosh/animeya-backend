class RoomsController < ApplicationController
    def index
        rooms = Room.all.select(:id, :token, :owner_id)
        render json:  rooms
    end
end