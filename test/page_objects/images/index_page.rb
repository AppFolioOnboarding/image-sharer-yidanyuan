require 'page_objects/images/image_item.rb'

module PageObjects
  module Images
    class IndexPage < AePageObjects::Document
      path :images

      collection :images, locator: '#images-list', item_locator: '.js-image-item', contains: ImageItem do
        def view!
          link = node.find('.js-image-url')
          link.click
          window.change_to(ShowImagePage)
        end
      end

      element :flash_message, locator: '#flash-message'

      def create_image!
        node.click_on('Upload image using url')
        window.change_to(NewImagePage)
      end

      def showing_image?(url:, tags: nil)
        images.any? do |image|
          image.url == url && ((tags.present? && image.tags == tags) || tags.nil?)
        end
      end
    end
  end
end
