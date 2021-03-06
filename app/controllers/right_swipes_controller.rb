class RightSwipesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        right_swipes = RightSwipe.all.select(:id, :room_id, :user_token, :anime_id)
        render json: right_swipes
    end

    def create
        room_id = params[:room_id]
        user_token = params[:user_token]
        anime_id = params[:anime_id]
        @swipes_by_room_id = RightSwipe.where(room_id: room_id)
        should_create = false
        is_matched = false

       

        if @swipes_by_room_id.length == 0
            should_create = true
        else
            @swipes_by_room_id.each do |attr_name|
                match_token = attr_name.user_token == user_token
                match_anime_id = attr_name.anime_id == anime_id
                if match_token && !match_anime_id
                    should_create = true
                elsif !match_token && !match_anime_id
                    should_create = true
                elsif !match_token && match_anime_id
                    should_create = true
                    is_matched = true
                else
                    should_create = false
                end
            end
        end

        if should_create
            @right_swipe = RightSwipe.create(room_id: room_id, 
            user_token: user_token, 
            anime_id: anime_id)
            success = true if @right_swipe.save
        end

        if is_matched
            render plain: 'matched'
        elsif success
            render plain: 'created'
        else
            render plain: 'could not create'
        end
    end

    private

    def owner_params
        params.require(:right_swipe).permit(:room_id, :user_token, :anime_id)
    end
end
