class LinksController < ApplicationController
  def index
    @link = Link.new
    @links = current_user.links if current_user
  end

  def create
    link = Link.new(link_params)
    link.user_id = current_user.id
    if link.valid_url?(link.url) && link.save
      flash[:success] = "Link created!"
      redirect_to links_path
    else
      flash[:danger] = "Please enter a title" if link.title.empty?
      flash[:danger] = "Invalid URI!" if !link.valid_url?(link.url)
      redirect_to links_path
    end
  end

  def link_params
    params.require(:link).permit(:url, :title)
  end
end
