class Wedding < ApplicationRecord
  require 'RMagick'
  include Magick
  has_one_attached :image
  after_create :attach_image

  def image_url 
    Rails.application.routes.url_helpers.url_for(image) if image.attached?
  end 

  private
  def attach_image
    #Invitaion template 1
    path = Rails.root.join("img/2.png")
    image = Magick::Image.read(path).first
    text = Magick::Draw.new
    text.pointsize = 160
    text.font = "fonts/WindSong-Medium.ttf"
    text.annotate(image, 0, 0, 525, 350, "#{self.kuyov.upcase[0]}&#{self.kelin.upcase[0]}")
    text.fill = '#45564E'
    text.pointsize = 68
    text.font = "fonts/Prata-Regular.ttf"
    text.gravity = NorthWestGravity
    num = 0
    if self.kuyov.length > 5
      num = (self.kuyov.length - 5) * 30
    end
    center = 700 - num
    text.annotate(image, 0, 0, center, 550, self.kuyov.upcase)
    num = 0
    if self.kelin.length > 5
      num = (self.kelin.length - 5) * 20
    end
    center = 690 - num
    text.annotate(image, 0, 0, center, 725, self.kelin.upcase)
    text.pointsize = 30
    text.annotate(image, 0, 0, 780, 1020, "SEPT")
    text.annotate(image, 0, 0, 790, 1190, "2023")
    text.annotate(image, 0, 0, 525, 1100, "YAKSHANBA")
    text.annotate(image, 0, 0, 940, 1100, "SOAT: 17:00")
    text.pointsize = 80
    text.annotate(image, 0, 0, 780, 1070, "30")
    text.pointsize = 40
    text.font = "fonts/Metal-Regular.ttf"
    text.annotate(image, 0, 0, 550, 1280, "Manzil: Shodiyona to'yxonasi, Namangan")
    image.write("temp_img/1.png")
    image_io = File.open("temp_img/1.png")
    self.image.attach(io: image_io, filename: "#{self.card}", content_type: 'image/png')
    File.delete(image_io)
  end
end
