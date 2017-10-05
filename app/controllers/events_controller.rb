class EventsController < InheritedResources::Base

  before_action :authenticate_admin!, :only => [:create, :destroy, :new, :edit, :update]
  
  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = 'Event was saved'
      redirect_to '/'
    end
  end
  
  def show
    @event = Event.friendly.find(params[:id])

  end


  def archive
    @events = Event.published.order(when: :desc)
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def new
    @event = Event.new
    # set_meta_tags title: 'New events'
  end

  
  def update
    @event = Event.find(params[:id])

    if @event.update_attributes(event_params)
      flash[:notice] = 'Event was updated.'
      redirect_to '/'
    end
  end
  
  def index
    @events = Event.published.order('events.when DESC')
    @latest = @events.first
  end

  def past
    @events = Event.future
    @past = Event.past
  end

  def destroy
    @event = Event.friendly.find(params[:id])
    @event.destroy!
    flash[:notice] = 'Event was deleted.'
    redirect_to '/'
  end
  
  protected
  
  def event_params
    params.require(:event).permit(:description, :when, :published, :title, :weblink1, :subtitle, :weblink2, :hidedate, :hide_text, video_attributes: [], soundcloud_attributes: [], image_attributes: [])
  end

end