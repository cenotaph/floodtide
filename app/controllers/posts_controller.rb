class PostsController < InheritedResources::Base
  # before_filter :authenticate_user!, :only => [:new, :edit, :create, :destroy, :update]
  before_action :authenticate_admin!, :only => [:new, :edit, :create, :destroy, :update]
  
  def index
    @posts = Post.published.order("published_at DESC")
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = 'Post was saved'
      redirect_to '/'
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy!
    redirect_to '/'
  end
  
  def edit
    @post = Post.friendly.find(params[:id])
  end
  
  def new
    @post = Post.new
    # set_meta_tags title: 'New posts'
  end

  
  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
      flash[:notice] = 'Post was updated.'
      redirect_to '/'
    end
  end
  
  def show
    @post = Post.friendly.find(params[:id])
  end
  
  protected
  
  def post_params
    params.require(:post).permit( :body, :published, :published_at, :sticky, :title, :user_id)
    
  end
end