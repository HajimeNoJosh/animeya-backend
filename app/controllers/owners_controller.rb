class OwnersController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        owners = Owner.all.select(:id, :username)
        render json: owners
    end

    def create
        @owner = Owner.create(owner_params)

        if @owner.save
            token = SecureRandom.alphanumeric
            @room = Room.create(token: token, owner_id: @owner.id)
            success = true if @room.save
        end
        if success 
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