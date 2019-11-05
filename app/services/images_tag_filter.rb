class ImagesTagFilter
  def self.filter(tag:)
    if tag
      Image.tagged_with(tag).order(created_at: :desc)
    else
      Image.all.order(created_at: :desc)
    end
  end
end
