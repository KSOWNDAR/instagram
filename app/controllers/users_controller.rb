class UsersController < ApplicationController
    def index
        @accounts = account.where("username like ?", "%#{params[:query]}%")
    end 
end
