class Image < ApplicationRecord
  # A valid image url must include a protocol, a hostname, and a file that's either .jpg, .gif, or .png
  valid_url_regex = %r{(https?:\/\/.*\.(?:png|jpg|gif|tif))}i

  acts_as_taggable
  validates :url, presence: true, format: { with: valid_url_regex,
                                            message: 'is invalid' }
end
