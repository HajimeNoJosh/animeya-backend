class VisitorsController < ApplicationController
    def index
        visitors = Visitor.all.select(:id, :username)
        render json:  visitors
    end
end
