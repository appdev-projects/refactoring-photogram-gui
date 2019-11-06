class UsersController < ApplicationController
  def index
    @users = User.all.order({ :username => :asc })

    render({ :template => "user_templates/index.html" })
  end

  def show
    the_username = params.fetch("the_username")
    @user = User.where({ :username => the_username }).at(0)

    render({ :template => "user_templates/show.html.erb" })
  end

  def create
    user = User.new

    user.username = params.fetch("query_username")

    user.save

    redirect_to("/users/#{user.username}")
  end
end
