class VisitorsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        visitors = Visitor.all.select(:id, :username, :room_id, :token)
        render json:  visitors
    end

    def show
        visitor = Visitor.find(params[:id])
        render json: visitor
    end

    def create
        visitor_token = SecureRandom.alphanumeric
        room_token = params[:token]
        @room = Room.find_by(token: room_token)
        @visitor = Visitor.create(username: params[:username], token: visitor_token, room_id: @room.id)
        
        if @visitor.save
          @room.update(visitors_joined: true)
          success = true if @room.save
        end
        if success
            redirect_to @visitor
         else
            render "new"
         end
    end

    def visitor_params
        params.require(:visitor).permit(:username, :token)
    end
end
