class ScoreController < ApplicationController
  def index

    @Details=Detail.find_by(name: session[:user_name])
  end
end
