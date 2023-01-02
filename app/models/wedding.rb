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
    
    daysUpper = {1 => "DUYSHANBA",
            2 => "SESHANBA", 
            3 => "CHORSHANBA",
            4 => "PAYSHANBA",
            5 => "JUMA",
            6 => "SHANBA",
            7 => "YAKSHANBA"}
    daysLower = {1 => "Duyshanba",
            2 => "Seshanba", 
            3 => "Chorshanba",
            4 => "Payshanba",
            5 => "Juma",
            6 => "Shanba",
            7 => "Yakshanba"}

    case self.card
      when "1"
        #Invitaion template 1
        path = Rails.root.join("img/1empty.png")
        image = Magick::Image.read(path).first
        text = Magick::Draw.new
        text.pointsize = 160
        text.font = "fonts/Caramel-Regular.ttf"
        text.fill = '#45564E'
        text.annotate(image, 0, 0, 660, 350, "#{self.kuyov.upcase[0]}&#{self.kelin.upcase[0]}")
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
        text.annotate(image, 0, 0, 800, 1020, self.sana.strftime("%^b"))
        text.annotate(image, 0, 0, 795, 1190, "#{self.sana.year}")
        weekcenter = 525
        if self.sana.wday == 5 || self.sana.wday == 6
          weekcenter = 575
        end
        text.annotate(image, 0, 0, weekcenter, 1100, daysUpper[self.sana.wday])
        text.annotate(image, 0, 0, 940, 1100, "SOAT: #{self.soat}")
        text.pointsize = 80
        text.annotate(image, 0, 0, 785, 1070, "#{self.sana.strftime("%d")}")
        text.pointsize = 40
        text.font = "fonts/Metal-Regular.ttf"
        text.annotate(image, 0, 0, 550, 1280, "Manzil: #{self.manzil}")
        image.write("temp_img/1.png")
        image_io = File.open("temp_img/1.png")
        self.image.attach(io: image_io, filename: "#{self.card}", content_type: 'image/png')
        File.delete(image_io)

      when "2"
        #Invitaion template 2
        path = Rails.root.join("img/2empty.png")
        image = Magick::Image.read(path).first
        text = Magick::Draw.new
        text.pointsize = 68
        text.font = "fonts/amsterdam-four.ttf"
        text.annotate(image, 0, 0, 710, 1020, "#{self.kuyov.upcase[0]} & #{self.kelin.upcase[0]}")
        text.fill = '#45564E'
        text.pointsize = 100
        text.font = "fonts/CormorantSC-Light.ttf"
        text.gravity = NorthWestGravity
        num = 0
        if self.kuyov.length > 5
          num = (self.kuyov.length - 5) * 20
        end
        center = 655 - num
        text.annotate(image, 0, 0, center, 350, self.kuyov.upcase)
        num = 0
        if self.kelin.length > 5
          num = (self.kelin.length - 5) * 20
        end
        center = 655 - num
        text.annotate(image, 0, 0, center, 520, self.kelin.upcase)
        text.pointsize = 30
        weekcenter = 385
        text.font = "fonts/Anaktoria.ttf"
        if self.sana.wday == 5 || self.sana.wday == 6
          weekcenter = 420
        end
        text.pointsize = 45
        text.annotate(image, 0, 0, weekcenter, 945, daysLower[self.sana.wday])
        text.annotate(image, 0, 0, 375, 1000, "#{self.sana.strftime('%B')} #{self.sana.strftime('%d')}")
        text.annotate(image, 0, 0, 1125, 945, "SOAT:")
        text.annotate(image, 0, 0, 1120, 1000, "#{self.soat} da")
        text.pointsize = 55
        text.font = "fonts/CormorantSC-Light.ttf"
        text.annotate(image, 0, 0, 380, 1200, "manzil: #{self.manzil.downcase}")
        image.write("temp_img/1.png")
        image_io = File.open("temp_img/1.png")
        self.image.attach(io: image_io, filename: "#{self.card}", content_type: 'image/png')
        File.delete(image_io)

        when "4"
        #Invitaion template 3
        if self.kuyov.length > 6
          path = Rails.root.join("img/3empty2.png")
        else 
          path = Rails.root.join("img/3empty.png")
        end
        image = Magick::Image.read(path).first
        text = Magick::Draw.new
        text.pointsize = 70
        text.fill = '#496F8B'
        text.font = "fonts/Ovo-regular.ttf"
        text.gravity = NorthWestGravity
        num = 0
        if self.kuyov.length > 5
          num = (self.kuyov.length - 5) * 20
        end
        center = 725 - num
        text.annotate(image, 0, 0, center, 510, self.kuyov.upcase)
        num = 0
        if self.kelin.length > 5
          num = (self.kelin.length - 5) * 20
        end
        center = 725 - num
        text.annotate(image, 0, 0, center, 680, self.kelin.upcase)
        text.pointsize = 36
        text.annotate(image, 0, 0, 390, 1050, "MANZIL: #{self.manzil.upcase}")
        text.pointsize = 75
        text.font = "fonts/GreatVibes-Regular.ttf"
        text.annotate(image, 0, 0, 675, 1175, "#{self.sana.strftime('%d.%m.%Y')}")
        text.pointsize = 45
        text.annotate(image, 0, 0, 750, 1290, "soat: #{self.soat}")
        image.write("temp_img/1.png")
        image_io = File.open("temp_img/1.png")
        self.image.attach(io: image_io, filename: "#{self.card}", content_type: 'image/png')
        File.delete(image_io)

       when "5"
        #Invitaion template 4
        path = Rails.root.join("img/4empty.png")
        image = Magick::Image.read(path).first
        text = Magick::Draw.new
        text.pointsize = 80
        text.fill = '#D8A556' 
        text.font = "fonts/amsterdam-four.ttf"
        text.annotate(image, 0, 0, 670, 400, "#{self.kuyov.upcase[0]}&#{self.kelin.upcase[0]}")
        text.font = "fonts/Bellefair-Regular.ttf"
        text.pointsize = 95
        text.gravity = NorthWestGravity
        num = 0
        if (self.kuyov.length  + self.kelin.length) > 9
          num = (self.kuyov.length  + self.kelin.length - 9) * 25
          text.pointsize = 80
        end
        center = 550 - num
        text.annotate(image, 0, 0, center, 550, "#{self.kuyov.upcase} & #{self.kelin.upcase}")
        text.font = "fonts/GreatVibes-Regular.ttf"
        text.pointsize = 50
        weekcenter = 535
        if self.sana.wday == 5 || self.sana.wday == 6
          weekcenter = 550
        end
        text.annotate(image, 0, 0, weekcenter, 1200, daysLower[self.sana.wday])
        text.annotate(image, 0, 0, 945, 1200, "soat: #{self.soat} da")
        text.annotate(image, 0, 0, 800, 1100, self.sana.strftime("%b"))
        text.pointsize = 145
        text.annotate(image, 0, 0, 780, 1150, "#{self.sana.strftime("%d")}")
        text.pointsize = 50
        text.annotate(image, 0, 0, 795, 1300, "#{self.sana.year}")
        text.font = "fonts/Bakerie-Bold.otf"
        text.pointsize = 48
        text.annotate(image, 0, 0, 390, 970, "MANZIL: #{self.manzil.upcase}")
        image.write("temp_img/1.png")
        image_io = File.open("temp_img/1.png")
        self.image.attach(io: image_io, filename: "#{self.card}", content_type: 'image/png')
        File.delete(image_io)
    end
  end
end
