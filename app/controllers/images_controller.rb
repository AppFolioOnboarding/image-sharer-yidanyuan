class ImagesController < ApplicationController
  def index; end

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
    if image_id_param == 'new'
      render :new
    else
      @image = Image.find(image_id_param)
    end
  end

  private

  def image_params
    params.require(:image).permit(:url)
  end

  def image_id_params
    params.permit(:id)[:id]
  end
end
