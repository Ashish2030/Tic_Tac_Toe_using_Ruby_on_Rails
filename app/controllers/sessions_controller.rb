class SessionsController < ApplicationController
  helper_method :check
  def check
    @Detail=Detail.find_by(name: session[:user_name])
    if(@Detail!=nil)
      return true
    else
      return false;
    end
  end
  def played
    puts "-------------------------------------------------------------------------------------"
    @Detail=Detail.find_by(name: session[:user_name])
    if @Detail
      @Detail.wins+=1 if params[:win]
      @Detail.loose+=1 if params[:loss]
      @Detail.tie+=1 if params[:tie]
      @Detail.save
    else
      @Detail = Detail.new(name: "#{session[:user_name]}", wins: 0,tie:0,loose:0)
      @Detail.wins+=1 if params[:win]
      @Detail.loose+=1 if params[:loss]
      @Detail.tie+=1 if params[:tie]
      @Detail.save
    end
  end
  skip_before_action :authorized, only: [:new, :create, :welcome]
  before_action :admin_logged_in?,except: [:new,:create]
  after_action :update_log,only: :destroy
  def new

  end
  def login
  end
  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_name] = @user.username
      redirect_to '/welcome'
    else
      redirect_to '/login'
      flash[:notice]="Invalid credentials"
    end
  end
  def logout
    session[:user_name]=nil
    flash[:notice]="You are logged Out"
    redirect_to :action => :new
  end
  def page_requires_login
  end
  def admin_logged_in?
    if session[:user_name].nil?
      flash[:notice]="First Login "
      redirect_to :controller => "sessions",:action => "create"
    end
  end
  def update_log
    logger.info "==============================Company is Deleted====================================="
  end
end


