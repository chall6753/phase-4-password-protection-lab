class UsersController < ApplicationController


    def create 
        user = User.create(user_params)
        if user.valid?
            session[:user_id] = user.id
            render json: user, status: :created
        else
            
            render json: {errors: "user not created"}, status: :unprocessable_entity
        end
      
    end
    def show 
        user = User.find_by_id(session[:user_id])
        if user
            
            render json: user, status: :ok
        else
            render json: {errors: "login failed"}, status: :unauthorized
        end
    end
    private

    def user_params
        params.permit(:username, :password, :password_confirmation)
    end
end
