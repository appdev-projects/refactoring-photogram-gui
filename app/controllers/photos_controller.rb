class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all
    
    @list_of_photos = matching_photos.order({ :created_at => :desc })

    render({ :template => "photo_templates/all_photos.html.erb"})
  end

  def create
    user_id = params.fetch("query_owner_id")
    image = params.fetch("query_image")
    caption = params.fetch("query_caption")

    the_photo = Photo.new
    the_photo.owner_id = user_id
    the_photo.image = image
    the_photo.caption = caption
    the_photo.save
    redirect_to("/photos/#{the_photo.id}")
  end

  def show
    photo_id = params.fetch("the_photo_id")

    matching_photos = Photo.where({ :id => photo_id })

    @the_photo = matching_photos.at(0)

    render({:template => "photo_templates/details.html.erb"})
  end

  def update
    id = params.fetch("the_photo_id")
    the_photo = Photo.where({ :id => id }).at(0)
    the_photo.caption = params.fetch("query_caption")
    the_photo.image = params.fetch("query_image")
    the_photo.save
    
    redirect_to("/photos/#{the_photo.id}")
  end
  
  def destroy
    id = params.fetch("the_photo_id")
    the_photo = Photo.where({ :id => id }).at(0)
    the_photo.destroy

    redirect_to("/photos")
  end
end
