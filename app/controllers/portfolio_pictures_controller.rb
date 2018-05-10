class PortfolioPicturesController < ApplicationController
  before_action :set_portfolio_picture, only: [:show, :edit, :update, :destroy]

  # GET /portfolio_pictures
  # GET /portfolio_pictures.json
  def index
    @portfolio_pictures = PortfolioPicture.all
  end

  # GET /portfolio_pictures/1
  # GET /portfolio_pictures/1.json
  def show
  end

  # GET /portfolio_pictures/new
  def new
    @portfolio_picture = PortfolioPicture.new
  end

  # GET /portfolio_pictures/1/edit
  def edit
  end

  # POST /portfolio_pictures
  # POST /portfolio_pictures.json
  def create
    @portfolio_picture = PortfolioPicture.new(portfolio_picture_params)

    respond_to do |format|
      if @portfolio_picture.save
        format.html { redirect_to @portfolio_picture, notice: 'Portfolio picture was successfully created.' }
        format.json { render :show, status: :created, location: @portfolio_picture }
      else
        format.html { render :new }
        format.json { render json: @portfolio_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portfolio_pictures/1
  # PATCH/PUT /portfolio_pictures/1.json
  def update
    respond_to do |format|
      if @portfolio_picture.update(portfolio_picture_params)
        format.html { redirect_to @portfolio_picture, notice: 'Portfolio picture was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio_picture }
      else
        format.html { render :edit }
        format.json { render json: @portfolio_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolio_pictures/1
  # DELETE /portfolio_pictures/1.json
  def destroy
    @portfolio_picture.destroy
    respond_to do |format|
      format.html { redirect_to portfolio_pictures_url, notice: 'Portfolio picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio_picture
      @portfolio_picture = PortfolioPicture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portfolio_picture_params
      params.require(:portfolio_picture).permit(:image_data, :profile_id, :style_id, :description)
    end
end
