class AdminuserController < Devise::SessionsController

  def new
    @user = User.new
    render :template => 'application/admin_sign_in'
    
  end
end