module PageObjects
  module Images
    class ShowImagePage < AePageObjects::Document
      path :image

      def image_url
        node.find('img')[:src]
      end

      def delete
        node.click_on('Delete image above')
        yield node.driver.browser.switch_to.alert
      end

      def delete_and_confirm!
        node.click_on('Delete image above')
        node.driver.browser.switch_to.alert.accept
        window.change_to(IndexPage)
      end

      def go_back_to_index!
        window.change_to(IndexPage)
      end
    end
  end
end
