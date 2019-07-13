class V1::SessionsController < ApplicationController
    def show
        current_user ? head(:ok) : head(:unauthorized)
    end

    def create 
        @user = User.where(email: params[:email]).first
        if @user&.valid_password?(params[:password])
            jwt = JWT.encode( {user_id: @user.id}, Rails.application.secrets.secret_key_base, 'HS256')
            # render :create, status: :created, locals: { token: @user.authentication_token }
            render :create, status: :created, locals: { token: jwt }
        else
            head(:unauthorized)
        end
    end

    def destroy
        current_user ? head(:ok) : head(:unauthorized)
    end
end