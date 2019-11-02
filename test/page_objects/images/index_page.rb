module PageObjects
  module Images
    class IndexPage < PageObjects::Document
      path :images

      collection :images, locator: '#images_list', item_locator: '.js-image-item' do
        def view!
          node.find('.js-image-url').click
          window.change_to(NewImagePage)
        end
      end

      def create_image!
        node.click_on('Upload image using urls')
        window.change_to(NewImagePage)
      end

      def show_image?(url:, tag_list: nil)
        images.any? do |image|
          image.url == url && ((tag_list.present? && image.tag_list == tag_list) || tag_list.nil?)
        end
      end
    end
  end
end
