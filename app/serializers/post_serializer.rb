class PostSerializer
  include JSONAPI::Serializer
  attributes :title, :id, :image, :image_url
end
