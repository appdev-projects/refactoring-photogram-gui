class UsersController < ApplicationController
  def index
    all_users = User.all

    @list_of_users = all_users.order({ :username => :asc })

    render({ :template => "user_templates/index.html" })
  end

  def show
    the_username = params.fetch("the_username")
   
    matching_users = User.where({ :username => the_username })

    @the_user = matching_users.at(0)

    render({ :template => "user_templates/show.html.erb" })
  end

  def create
    the_user = User.new

    the_user.username = params.fetch("query_username")

    the_user.save

    redirect_to("/users/#{the_user.username}")
  end
end
