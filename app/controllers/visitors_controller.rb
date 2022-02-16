class VisitorsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        visitors = Visitor.all.select(:id, :username, :room_id, :token, :status)
        render json:  visitors
    end

    def show
        visitor = Visitor.find(params[:id])
        render json: visitor
    end

    def find_visitors_by_room
        visitor = Visitor.where(room_id: params[:room_id])
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

    def update
        visitor = Visitor.find_by(token: params[:token])
        visitor.update(status: params[:status])
        if visitor.save
            redirect_to visitor
            ActionCable.server.broadcast "room_channel_#{room_id}", {message: "someone_finished"}
        else
            render "new"
        end
    end

    def visitor_params
        params.require(:visitor).permit(:username, :token, :status)
    end
end
