class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_admin!, :only => [:admin]
  
  
  def admin
    @events = Event.all
    @pages = Page.all
    @archive_videos = Video.archive
    @posts = Post.all
  end
  

  def home
    @carousel = []
    @carousel += Event.future.joins(:images).where("images.id is not null").all
    @archive = Event.past.published.order('rand()').limit(3)
    @about = Page.friendly.find('about')  
    @carousel << @about
    past = Event.past.joins(:images).where("images.id is not null").all
    if past.length > 3
      @carousel += past[0..2]
    else
      @carousel += pastd
    end

  end
  
  def play
  end

  
  def authenticate_admin!
    if user_signed_in?
      if !current_user.admin?
        flash[:error] = 'You must be an admin to access this.'
        redirect_to '/admin_sign_in'
      end
    else
      flash[:error] = 'You must be an admin to access this.'
      redirect_to '/admin_sign_in'
    end
  end
  

end
