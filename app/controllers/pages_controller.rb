class PagesController < InheritedResources::Base
   before_action :authenticate_admin!, :except => [:show]
  
  
   def show
     @page = Page.friendly.find(params[:id])
   end
   
   def create
     @page = Page.new(page_params)
     if @page.save
       flash[:notice] = 'Page was saved'
       redirect_to '/'
     end
   end
  
   def destroy
     @page = Page.find(params[:id])
     @page.destroy!
     redirect_to '/'
   end
  
   def edit
     @page = Page.find(params[:id])
   end
  
   def new
     @page = Page.new
     # set_meta_tags title: 'New page'
   end

  
   def update
     @page = Page.find(params[:id])

     if @page.update_attributes(page_params)
       flash[:notice] = 'Page was updated.'
       redirect_to '/'
     end
   end
  

   protected  
   
   def page_params
     params.require(:page).permit(:body, :published, :slug, :subtitle, :title, :carousel, :page_icon, :page_icon_caption, image_attributes: [])     
   end
end
