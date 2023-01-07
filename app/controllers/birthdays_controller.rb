class BirthdaysController < ApplicationController
  before_action :set_birthday, only: %i[ show update destroy ]

  # GET /birthdays
  def index
    @birthdays = Birthday.all

    render json: @birthdays
  end

  # GET /birthdays/1
  def show
    render json: @birthday
  end

  # POST /birthdays
  def create
    @birthday = Birthday.new(birthday_params)

    if @birthday.save
      render json: @birthday.image_url, status: :created, location: @birthday
    else
      render json: @birthday.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /birthdays/1
  def update
    if @birthday.update(birthday_params)
      render json: @birthday
    else
      render json: @birthday.errors, status: :unprocessable_entity
    end
  end

  # DELETE /birthdays/1
  def destroy
    @birthday.destroy
  end

  def finalimageb
    images = Birthday.all
    imagesAll = []
    images.each do |image|
      imagesAll.append([image.id, image.image_url])
    end
    render json: @birthday.card
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_birthday
      @birthday = Birthday.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def birthday_params
      params.require(:birthday).permit(:mehmon, :mezbon, :card, :tel, :sana, :manzil, :soat)
    end
end
