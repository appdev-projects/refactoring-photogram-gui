class CommentsController < ApplicationController
  def index
    list_of_comments = Comment.all.order({ :created_at => :asc })

    render({ :json => list_of_comments.as_json })
  end

  def show
    the_id = params.fetch(:the_comment_id)

    matching_comments = Comment.where({ :id => the_id })
    
    the_comment = matching_comments.at(0)
    
    render({ :json => the_comment.as_json })
  end

  def create
    the_comment = Comment.new
    the_comment.author_id = params.fetch(:query_author_id, nil)
    the_comment.photo_id = params.fetch(:query_photo_id, nil)
    the_comment.body = params.fetch(:query_body, nil)

    the_comment.save

    redirect_to("/photos/#{the_comment.photo_id}")
  end
end
