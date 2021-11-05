class UsersController < ApplicationController

  skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
  end
  def create
    @user = User.create(params.require(:user).permit(:username, :password))
    respond_to do |format|
    if @user.save
      flash[:success] = 'Account created'
      format.html { redirect_to '/login', notice: "Library was successfully created." }
      format.json { render :show, status: :created, location: @user }
    else
      flash[:notice] ='ERROR: Account was not created'
      format.html { render "users/new", status: :unprocessable_entity }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
    end
    end


  end

