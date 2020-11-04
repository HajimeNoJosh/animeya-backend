class VisitorsController < ApplicationController
    def index
        visitors = Visitor.all.select(:id, :username, :room_id)
        render json:  visitors
    end
end
