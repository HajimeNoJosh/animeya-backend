class OwnersController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        owners = Owner.all.select(:id, :username, :token)
        render json: owners
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
            redirect_to @room
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


    private

    def owner_params
        params.require(:owner).permit(:username)
    end

end

