class RightSwipesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        right_swipes = RightSwipe.all.select(:id, :room_id, :user_token, :anime_id, :score, :image, :anime_title)
        render json: right_swipes
    end

    def get_rooms_liked_anime
        room_id = params[:room_id]
        right_swipes = RightSwipe.where(room_id: room_id)
        render json: right_swipes
    end

    def create
        room_id = params[:room_id]
        user_token = params[:user_token]
        anime_id = params[:anime_id]
        score = params[:score]
        anime_title = params[:anime_title]
        image = params[:image]

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
            @right_swipe = RightSwipe.create(room_id: params[:room_id], 
            user_token: params[:user_token], 
            anime_id: params[:anime_id],
            score: params[:score],
            anime_title: params[:anime_title],
            image: params[:image])
            success = true if @right_swipe.save
        end

        if is_matched
            render plain: 'matched'
            ActionCable.server.broadcast "room_channel_#{room_id}", {message: "matched", anime_id: anime_id}
        elsif success
            render plain: 'created'
            ActionCable.server.broadcast "room_channel_#{room_id}", message: "created"
        else
            render plain: 'could not create'
            ActionCable.server.broadcast "room_channel_#{room_id}", message: "matched"
        end
    end

    private

    def right_swipe_params
        params.require(:right_swipe).permit(:room_id, :user_token, :anime_id)
    end
end
