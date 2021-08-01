class RoomsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        rooms = Room.all.select(:id, :visitors_joined, :owner_id, :token)
        render json: rooms
    end
    
    def find_one
        room = Room.find_by(token: params[:token])
        render json: room
    end

    def show
        qry = Jikan::Query.new
        results = qry.search(:anime)
        # room = Room.find_by(token: params[:token])
        render json: results
    end
end