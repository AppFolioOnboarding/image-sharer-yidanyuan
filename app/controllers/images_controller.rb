class ImagesController < ApplicationController
  def index
    tag = image_tag_params
    @images = ImagesTagFilter.filter(tag: tag)
    redirect_to images_path if @images.empty?
  end

  def new
    @image = Image.new
  end

  def create
    image = Image.new(image_params)
    if image.save
      # images_path = /images(.:format); wanted format: /images/:id
      redirect_to image_path(image)
    else
      flash[:error] = 'Invalid Url!'
      redirect_to new_image_path
    end
  end

  def show
    image_id_param = image_id_params
    @image = Image.find_by(id: image_id_param)

    redirect_to images_path unless @image
  end

  private

  def image_params
    params.require(:image).permit(:url, :tag_list)
  end

  def image_id_params
    params.permit(:id)[:id]
  end

  def image_tag_params
    params.permit(:tag)[:tag]
  end
end
