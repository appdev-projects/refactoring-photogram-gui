class CommentsController < ApplicationController
  def index
    comments = Comment.all.order({ :created_at => :asc })

    render({ :json => comments.as_json })
  end

  def show
    the_id = params.fetch(:the_comment_id)
    comment = Comment.where({ :id => the_id }).at(0)

    render({ :json => comment.as_json })
  end

  def create
    comment = Comment.new

    comment.author_id = params.fetch(:query_author_id, nil)
    comment.photo_id = params.fetch(:query_photo_id, nil)
    comment.body = params.fetch(:query_body, nil)

    comment.save

    redirect_to("/photos/#{comment.photo_id}")
  end
end
