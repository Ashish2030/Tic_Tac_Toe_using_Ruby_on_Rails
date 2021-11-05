class Session < ApplicationRecord
  def logout
    session[:user_name]=nil
    flash[:notice]="You are logged Out"
    redirect_to :action => :login
  end

end
