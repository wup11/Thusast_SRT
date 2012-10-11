class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  def signed_in?
    if !user_signed_in?
      redirect_to new_user_session_path
    end
  end
  
  def isAdmin? id
    [1].include? id
  end

  def admin?
    if !isAdmin? current_user.id
      redirect_to root_path, :notice=>"You're not authorized to access this page"
    end
  end

  def isSAST? id
    (3..99).include? id
  end
end
