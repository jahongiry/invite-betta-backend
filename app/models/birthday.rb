class Birthday < ApplicationRecord
   
  include Magick
  has_one_attached :image
  after_create :attach_image

  def image_url 
    Rails.application.routes.url_helpers.url_for(image) if image.attached?
  end 

  private
  def attach_image
    daysUpper = {1 => "DUYSHANBA",
            2 => "SESHANBA", 
            3 => "CHORSHANBA",
            4 => "PAYSHANBA",
            5 => "JUMA",
            6 => "SHANBA",
            0 => "YAKSHANBA"}
    daysLower = {1 => "Duyshanba",
            2 => "Seshanba", 
            3 => "Chorshanba",
            4 => "Payshanba",
            5 => "Juma",
            6 => "Shanba",
            0 => "Yakshanba"}
 case self.card
      when "1birthday"
        #Invitaion template 1
        path = Rails.root.join("img/1.1empty.png")
        image = Magick::Image.read(path).first
        text = Magick::Draw.new
        text.pointsize = 65
        text.font = "fonts/Prata-Regular.ttf"
        text.fill = '#FEFEFE'
        text.gravity = NorthWestGravity
        num = 0
        if self.mehmon.length > 5
          num = (self.mehmon.length - 5) * 20
        end
        center = 745 - num
        text.annotate(image, 0, 0, center, 790, self.mehmon.capitalize)
        num = 0
        if self.mezbon.length > 5
          num = (self.mezbon.length - 5) * 22
        end
        center = 630 - num
        text.pointsize = 40
        text.annotate(image, 0, 0, center, 1075, "HURMAT BILAN: #{self.mezbon.upcase}")
        text.font = "fonts/GlacialIndifference-Regular.ttf"
        text.pointsize = 45
        text.fill = '#D8A556'
        text.annotate(image, 0, 0, 250, 1555, "MANZIL: #{self.manzil.upcase}")
        text.font = "fonts/GreatVibes-Regular.ttf"
        text.pointsize = 50
        weekcenter = 546
        if self.sana.wday == 5 || self.sana.wday == 6
          weekcenter = 584
        end
        text.annotate(image, 0, 0, weekcenter, 1225, daysLower[self.sana.wday])
        text.pointsize = 48
        text.annotate(image, 0, 0, 630, 1310, self.sana.strftime("%b"))
        text.annotate(image, 0, 0, 960, 1310, "#{self.sana.year}")
        text.pointsize = 45
        text.annotate(image, 0, 0, 960, 1225, "soat: #{self.soat} da")
        text.pointsize = 150
        text.annotate(image, 0, 0, 779, 1165, "#{self.sana.strftime("%d")}")
        image.write("temp_img/1.png")
        image_io = File.open("temp_img/1.png")
        self.image.attach(io: image_io, filename: "#{self.card}", content_type: 'image/png')
        File.delete(image_io)

        when "2birthday"
        #Invitaion template 2
        path = Rails.root.join("img/1.2empty.png")
        image = Magick::Image.read(path).first
        text = Magick::Draw.new
        text.pointsize = 185
        text.font = "fonts/daydream.ttf"
        text.fill = '#ED2F92'
        text.gravity = NorthWestGravity
        num = 0
        if self.mezbon.length > 5
          text.pointsize = 165
          num = (self.mezbon.length - 5) * 30
        end
        center = 590 - num
        text.annotate(image, 0, 0, center, 350, "#{self.mezbon.capitalize}ning")
        num = 0
        if self.mehmon.length > 5
          num = (self.mehmon.length - 5) * 22
        end
        center = 700 - num
        text.pointsize = 70
        text.font = "fonts/Lobster-Regular.ttf"
        text.annotate(image, 0, 0, center, 928, "#{self.mehmon.upcase}")
        text.fill = '#DF147C'
        text.font = "fonts/Madelyn.otf"
        text.pointsize = 95
        text.annotate(image, 0, 0, 475, 1220, "#{self.sana.strftime('%d')} #{self.sana.strftime('%b')} #{self.sana.year} SOAT: #{self.soat}")
        text.font = "fonts/GlacialIndifference-Regular.ttf"
        text.pointsize = 36
        text.fill = '#E36D56'
        text.annotate(image, 0, 0, 578, 1555, "MANZIL: #{self.manzil.upcase}")
        image.write("temp_img/1.png")
        image_io = File.open("temp_img/1.png")
        self.image.attach(io: image_io, filename: "#{self.card}", content_type: 'image/png')
        File.delete(image_io)

         when "3birthday"
        #Invitaion template 3
        path = Rails.root.join("img/1.3empty.png")
        image = Magick::Image.read(path).first
        text = Magick::Draw.new
        text.pointsize = 185
        text.font = "fonts/daydream.ttf"
        text.fill = '#4E362B'
        text.gravity = NorthWestGravity
        num = 0
        if self.mehmon.length > 5
          num = (self.mehmon.length - 5) * 22
        end
        center = 270 - num
        text.pointsize = 100
        text.font = "fonts/PlaylistScript.ttf"
        text.annotate(image, 0, 0, center, 100, "Assalomu alekum #{self.mehmon.capitalize}!")
        text.font = "fonts/BebasNeue-Regular.ttf"
        text.pointsize = 215
        num = 0
        if self.mezbon.length > 5
          text.pointsize = 165
          num = (self.mezbon.length - 5) * 30
        end
        center = 380 - num
        text.annotate(image, 0, 0, center, 310, "#{self.mezbon.upcase}ning")
        text.font = "fonts/Madelyn.otf"
        text.pointsize = 78
        text.annotate(image, 0, 0, 270, 800, "#{daysUpper[self.sana.wday]},")
        text.pointsize = 98
        text.annotate(image, 0, 0, 270, 905, "#{self.sana.strftime('%d')}  #{self.sana.strftime('%B').upcase},  #{self.sana.year}")
        text.pointsize = 175
        text.font = "fonts/BebasNeue-Regular.ttf"
        text.annotate(image, 0, 0, 270, 1100, "SOAT #{self.soat}")
        text.font = "Kollektif.ttf" 
        text.pointsize = 45
        text.fill = '#000000'
        text.annotate(image, 0, 0, 120, 1470, "MANZIL: #{self.manzil.upcase}")
        image.write("temp_img/1.png")
        image_io = File.open("temp_img/1.png")
        self.image.attach(io: image_io, filename: "#{self.card}", content_type: 'image/png')
        File.delete(image_io)
    end
  end
end
