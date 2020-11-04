class RoomsController < ApplicationController
    def index
        rooms = Room.all.select(:id, :username)
        render json: rooms
    end
end