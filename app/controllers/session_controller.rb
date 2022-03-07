class SessionController < ApplicationController

    def create
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: {errors: "user not created"}, status: :unauthorized
        end
    end
    def destroy
        user= User.find_by_id(session[:user_id])
        session.delete :user_id
    end
end
