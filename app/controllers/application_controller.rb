class ApplicationController < ActionController::Base
  before_action :set_current_user
  
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
  
  def authenticate_user
    if @current_user == nil
      flash[:notice] = "新規登録 または ログイン が必要です"
      redirect_to("/")
    end
  end
  
  def forbid_login_user
    if @current_user
      flash[:notice] = "既にログインしています"
      redirect_to("/users/#{@current_user.id}")
    end
  end

end
