class RoomsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        room = Room.find(params[:format])
        render json:  room
    end

    def show
        qry = Jikan::Query.new
        results = qry.search(:anime)
        # room = Room.find_by(token: params[:token])
        render json: results

    end
end