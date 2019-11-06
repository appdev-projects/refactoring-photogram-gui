class PhotosController < ApplicationController
  def index
    @photos = Photo.order({ :created_at => :desc })
    
    render({ :template => "photo_templates/all_photos.html.erb"})
  end

  def create
    user_id = params.fetch("query_owner_id")
    image = params.fetch("query_image")
    caption = params.fetch("query_caption")
    photo = Photo.new
    photo.owner_id = user_id
    photo.image = image
    photo.caption = caption
    photo.save
    redirect_to("/photos/#{photo.id}")
  end

  def show
    p_id = params.fetch("the_photo_id")
    @photo = Photo.where({ :id => p_id }).at(0)

    render({:template => "photo_templates/details.html.erb"})
  end
end
