class RightSwipesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        right_swipes = RightSwipe.all.select(:id, :room_token, :user_token, :anime_id)
        render json: right_swipes
    end

    def create
        @right_swipe = RightSwipe.create(room_token: params[:room_token], 
                                         user_token: params[:user_token], 
                                         anime_id: params[:anime_id])

        if @right_swipe.save
            p 'created'
         else
            render "new"
         end

    end

    private

    def owner_params
        params.require(:right_swipe).permit(:room_token, :user_token, :anime_id)
    end
end
