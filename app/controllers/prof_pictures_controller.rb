class ProfPicturesController < ApplicationController
  before_action :set_prof_picture, only: [:show, :edit, :update, :destroy]

  # GET /prof_pictures
  # GET /prof_pictures.json
  def index
    @prof_pictures = ProfPicture.all
  end

  # GET /prof_pictures/1
  # GET /prof_pictures/1.json
  def show
  end

  # GET /prof_pictures/new
  def new
    @styles = Style.all
    @prof_picture = ProfPicture.new
  end

  # GET /prof_pictures/1/edit
  def edit
  end

  # POST /prof_pictures
  # POST /prof_pictures.json
  def create
    @styles = Style.all
    @prof_picture = ProfPicture.new(prof_picture_params)

    #Assign current user to prof_picture
    @prof_picture.profile = current_user.profile

    #Add style to current_user.styles
    unless current_user.profile.styles.include?(Style.find(params[:prof_picture][:style_id]))
        current_user.profile.styles << Style.find(params[:prof_picture][:style_id])
    end

    respond_to do |format|
      if @prof_picture.save
        format.html { redirect_to @prof_picture, notice: 'Prof picture was successfully created.' }
        format.json { render :show, status: :created, location: @prof_picture }
      else
        format.html { render :new }
        format.json { render json: @prof_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prof_pictures/1
  # PATCH/PUT /prof_pictures/1.json
  def update
    respond_to do |format|
      if @prof_picture.update(prof_picture_params)
        format.html { redirect_to @prof_picture, notice: 'Prof picture was successfully updated.' }
        format.json { render :show, status: :ok, location: @prof_picture }
      else
        format.html { render :edit }
        format.json { render json: @prof_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prof_pictures/1
  # DELETE /prof_pictures/1.json
  def destroy
    @prof_picture.destroy
    respond_to do |format|
      format.html { redirect_to prof_pictures_url, notice: 'Prof picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prof_picture
      @prof_picture = ProfPicture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prof_picture_params
      params.require(:prof_picture).permit(:image, :profile_id, :style_id, :description)
    end
end
