module PageObjects
  module Images
    class NewImagePage < AePageObjects::Document
      path :new_image
      path :images

      form_for :image do
        element :url, locator: '#image_url'
        element :tag_list, locator: '#image_tag_list'
      end

      def create_image!(imgurl: nil, taglist: nil)
        url.set(imgurl) if imgurl.present?
        tag_list.set(taglist) if taglist.present?
        node.click_button('Create Image')
        window.change_to(ShowImagePage, IndexPage)
      end
    end
  end
end
