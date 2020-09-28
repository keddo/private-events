class UsersController < ApplicationController
    before_action :set_user, except: %i[new index create ]
    def index
    @users = User.all
    end
    def new 
    @user = User.new
    end

    def create
    @user = User.new(user_params);
    if @user.save
        flash[:success] = "User registered successfully"
        redirect_to user_path(@user)
    else
        render :new
    end
    end
    def show 

    end
 private 

 def set_user
  @user = User.find(params[:id])
 end
 def user_params
  params.require(:user).permit(:username, :name, :email, :password, :password_confirmation)
 end
end
