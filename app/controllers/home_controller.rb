class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:annoncement]
  
  def index
  end
  
  def annoncement
    id = params[:id]
    respond_to do |format|
      format.html {render "annoncement#{id}"}
    end
  end
end
