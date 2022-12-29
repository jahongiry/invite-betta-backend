class WeddingsController < ApplicationController
  before_action :set_wedding, only: %i[ show update destroy ]

  # GET /weddings
  def index
    @weddings = Wedding.all

    render json: @weddings
  end

  # GET /weddings/1
  def show
    render json: @wedding
  end


  # POST /weddings
  def create
    @wedding = Wedding.new(wedding_params)

    if @wedding.save
      render json: @wedding.image_url, status: :created, location: @wedding
    else
      render json: @wedding.errors, status: :unprocessable_entity
    end
  end


  def finalimage 
    images = Wedding.all
    imagesAll = []
    images.each do |image|
      imagesAll.append([image.id, image.image_url])
    end
    render json: @wedding.card
  end

  # PATCH/PUT /weddings/1
  def update
    if @wedding.update(wedding_params)
      render json: @wedding
    else
      render json: @wedding.errors, status: :unprocessable_entity
    end
  end

  # DELETE /weddings/1
  def destroy
    @wedding.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wedding
      @wedding = Wedding.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wedding_params
      params.require(:wedding).permit(:kuyov, :kelin, :card, :tel, :sana, :soat, :manzil)
    end
end
