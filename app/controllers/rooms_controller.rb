class RoomsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        rooms = Room.all.select(:id, :token, :visitors_joined, :owner_id)
        render json:  rooms
    end

    def show
        room = Room.find_by(token: params[:token])
        render json: room

    end
end