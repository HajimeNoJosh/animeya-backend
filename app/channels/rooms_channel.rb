class RoomsChannel < ApplicationCable::Channel
    def subscribed
      stream_from "room_channel_#{params[:room_id]}"
    end

    def joined(data)
    end

    def unsubscribed
    end
end
