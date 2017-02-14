class LinksController < ApplicationController
  def index
    @link = Link.new
    @links = current_user.links if current_user
  end

  def create
    link = Link.new(link_params)
    link.user_id = current_user.id
    if link.valid_url?(link.url) && link.save
      Publisher.publish("links", link.attributes)
      flash[:success] = "Link created!"
      redirect_to links_path
    else
      flash[:danger] = "Please enter a title" if link.title.empty?
      flash[:danger] = "Invalid URI!" if !link.valid_url?(link.url)
      redirect_to links_path
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    link = Link.find(params[:id])
    if link.valid_url?(link.url)&& link.update_attributes(link_params)
      flash[:success] = "Link updated!"
      redirect_to links_path
    else
      flash[:danger] = "Please enter a title" if link.title.empty?
      flash[:danger] = "Invalid URI!" if !link.valid_url?(link.url)
      redirect_to edit_link_path(link)
    end
  end

  private

    def link_params
      params.require(:link).permit(:url, :title)
    end
end
