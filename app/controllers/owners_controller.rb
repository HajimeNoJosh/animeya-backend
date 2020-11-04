class OwnersController < ApplicationController
    def index
        owners = Owner.all.select(:id, :username)
        render json: owners
    end
end