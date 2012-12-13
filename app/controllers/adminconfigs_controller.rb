class AdminconfigsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin?

  def index
    @adminconfigs = Adminconfig.all
    respond_to do |format|
      format.html
    end
  end
  
  def edit
    @adminconfig = Adminconfig.find params[:id]
  end

  def update
    @adminconfig = Adminconfig.find params[:id]
    @adminconfig.update_attributes params[:adminconfig]

    redirect_to adminconfigs_path
  end

  def is_admin? 
    if !current_user.isAdmin?
      redirect_to :root
    end
  end
end
