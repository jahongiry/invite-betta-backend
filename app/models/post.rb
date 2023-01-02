class Post < ApplicationRecord
  has_one_attached :image
  after_create :attach_image

  def image_url 
    Rails.application.routes.url_helpers.url_for(image) if image.attached?
  end 

  private
  def attach_image 
    imaging = File.open('img/4.png')
    self.image.attach(io: imaging, filename: '4', content_type: 'image/png')
  end
end
