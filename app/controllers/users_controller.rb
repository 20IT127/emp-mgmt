class UsersController < ApplicationController
    def index
        @users = User.all.page(params[:page]).per(params[:limit])
    end

    def show
        @users = User.find(params[:id])
    end

    def edit
        @users = User.find(params[:id])
    end

    def update
        @users = User.find(params[:id])
        if @users.update(user_params)
            redirect_to users_url, notice: "Users is updated with New Role."
        else 
            render :edit, status: :unprocessable_entity
        end
    end

    private
    def user_params
        params.require(:user).permit({role_ids: []})
    end
end