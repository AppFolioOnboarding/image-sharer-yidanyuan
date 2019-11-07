module PageObjects
  module Images
    class ImageItem < AePageObjects::Element
      def url
        node.find('img')[:src]
      end

      def tags
        node.all('li').map(&:text).join(', ')
      end
    end
  end
end
