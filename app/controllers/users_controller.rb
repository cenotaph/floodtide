class UsersController < InheritedResources::Base
  actions :show,  :update, :upload_avatar
  before_action :authenticate_user!
  
  def upload_avatar
    @user = User.find(params[:id])
    if current_user != @user && !current_user.admin?
      flash[:error] = 'You cannot edit someone else\'s profile'
      redirect_to current_user
    end
  end
  
  def update
    @user = User.find(params[:id])
    if current_user == @user
      if @user.update_attributes(user_params)
        flash[:notice] = 'User updated'
        redirect_to posts_path
      end
    end
  end

  protected
  
  def user_params
    params.require(:user).permit(:avatar)
  end
end