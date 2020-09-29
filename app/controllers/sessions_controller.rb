class SessionsController < ApplicationController
    def new 

    end

    def create
        @user = User.find_by(email: params[:session][:email])
        
        if @user && @user.password == params[:session][:password]
            session[:user_id] = @user.id
            flash[:success] = "Sucessfully login in!"
            redirect_to users_path
        else
            flash.now[:danger] = "User name or password invalid!"
            render :new
        end
    end
    
    def destroy
    
    end
end
