class V1::SessionsController < ApplicationController
    def show
        current_user ? head(:ok) : head(:unauthorized)
    end

    def create 
        @user = User.where(email: params[:email]).first
        if @user&.valid_password?(params[:password])
            render :create, status: :created, locals: { token: @user.authentication_token }
        else
            head(:unauthorized)
        end
    end

    def destroy
        current_user ? head(:ok) : head(:unauthorized)
    end
end