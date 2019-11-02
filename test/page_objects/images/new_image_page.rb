module PageObjects
  module Images
    class NewImagePage < PageObjects::Document
      path new_image
      path images

      form_for :image do
        element :url, locator: '#image-url'
        element :tag_list, locator: '#image-tag-list'
      end

      def create_image!(imgurl: nil, taglist: nil)
        url.set(imgurl) if imgurl.present
        tag_list.set(taglist) if taglist.present
        node.click_button('Create Image')
        window.change_to(ShowImagePage, NewImagePage)
      end
    end
  end
end
