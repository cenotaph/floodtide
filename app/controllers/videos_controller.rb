class VideosController < InheritedResources::Base

  before_action :authenticate_admin!, :only => [:create, :destroy, :new, :edit, :update]
  
  
  def create
    @video = Video.new(video_params)
    if @video.save
      flash[:notice] = 'Video was saved'
      redirect_to '/'
    end
  end
  
  def destroy
    @video = Video.find(params[:id])
    @video.destroy!
    redirect_to '/'
  end
  
  def edit
    @video = Video.find(params[:id])
  end
  
  def new
    @video = Video.new
   
  end

  
  def update
    @video = Video.find(params[:id])

    if @video.update_attributes(video_params)
      flash[:notice] = 'Video was updated.'
      redirect_to '/'
    end
  end
  

  protected 
  
  def video_params
    params.require(:video).permit(:codenumber, :published, :title, :event_id, :for_archive, :in_url)
  end
  
end