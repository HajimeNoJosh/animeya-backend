class OwnersController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        owners = Owner.all.select(:id, :username, :token, :status)
        render json: owners
    end

    def show
        owner = Owner.find(params[:id])
        render json: owner
    end

    def show_room
        room = Room.find_by(owner_id: params[:id])
        render json: room
    end

    def create
        owner_token = SecureRandom.alphanumeric
        @owner = Owner.create(username: params[:username], token: owner_token)

        if @owner.save
            room_token = SecureRandom.alphanumeric
            @room = Room.create(token: room_token, owner_id: @owner.id)
            success = true if @room.save
        end

        if success 
            redirect_to @owner
         else
            render "new"
        end
    end

    def update
        @owner = Owner.find_by(id: params[:id])
    
        @owner.update(owner_params)
        if @owner.save
            redirect_to @owner
        else
            render "new"
        end
    end

    def update_status
        owner = Owner.find_by(token: params[:user_token])
        owner.update(status: params[:status])
        if owner.save
            ActionCable.server.broadcast "room_channel_#{params[:room_id]}", {message: "someone_finished"}
        else
            render "new"
        end
    end

    private

    def owner_params
        params.require(:owner).permit(:username, :status, :token)
    end
end

