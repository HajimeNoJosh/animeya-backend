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
        results = HTTParty.get('https://api.jikan.moe/v4/anime')
        # room = Room.find_by(token: params[:token])
        render json: results
    end

    def status
        overall_status = false
        room = Room.find_by(token: params[:token])
        puts room.id
        puts room.visitors_joined.nil?
        owner = Owner.find_by(id: room[:owner_id])

        if owner.status == "Finished"
            overall_status = true
        end

        unless room.visitors_joined.nil?
            room.visitors.each do |visitor|
                if visitor.status == "Finished"
                    overall_status = true
                else
                    overall_status = false
                end
            end
        end
        render json: overall_status
    end

    def room_params
        params.require(:room).permit(:token)
    end
end