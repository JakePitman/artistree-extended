class RequestsController < ApplicationController
    #before_action :set_request!, only: [:show, :edit, :update, :destroy]

  def index
      
  end

  def edit
  end

  def charge 
        @amount = (params[:amount].to_i * 100)
        @request = Request.find(params[:id])
        @request.update(paid: true)
        customer = Stripe::Customer.create(
          :email => params[:stripeEmail],
          :source  => params[:stripeToken]
        )
      
        charge = Stripe::Charge.create(
          :customer    => customer.id,
          :amount      => (@amount),
          :description => 'Rails Stripe customer',
          :currency    => 'aud'
        )

        redirect_back(fallback_location: requests_show_path) 
      
      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to new_charge_path 
  end

  def process_request
      @request = Request.find(params[:id])
      @request.confirmed = false
      @request.update(deny_params)
      redirect_to request_show_path
  end

  def update
      puts "IN UPDATE"
      @request = Request.find(params[:id])
      if params[:request_option] == "0"
          puts "IN REQUEST OPTION 0"
          @request.update(confirmed: false)
      #elsif params[:request_option] == "1"
      elsif params[:request][:confirmed]  == "true"
          @request.update(confirmed: true)
          @request.update(price: params[:request][:price])
      end
      redirect_to requests_show_path({id: @request.id})
  end

  def new
      @styles = Style.all
      @request = Request.new
      @artist = User.find(params[:artist])
      render :new
  end

  def create
      @styles = Style.all
      @request = Request.new(request_params)
      @request.paid = false
      @request.buyer = current_user
      @request.artist = User.find(params[:request][:artist_id])
      if @request.save
        redirect_to current_user_profile_path
      else
        render :new
      end
  end


  def destroy
    @request.destroy
  end

  def show
      @request = Request.find(params[:id])
      @message = Message.new
  end

private
    def request_params
      params.require(:request).permit(:buyer_id, :artist_id, :image, :style_id)
    end

    def deny_params
    end
end




#  def edit
#  end
#
#  def create
#    @styles = Style.all
#    @prof_picture = ProfPicture.new(prof_picture_params)
#
#    #Assign current user to prof_picture
#    @prof_picture.profile = current_user.profile
#
#    #Add style to current_user.styles
#    unless current_user.profile.styles.include?(Style.find(params[:prof_picture][:style_id]))
#        current_user.profile.styles << Style.find(params[:prof_picture][:style_id])
#    end
#
#    respond_to do |format|
#      if @prof_picture.save
#        format.html { redirect_to @prof_picture, notice: 'Prof picture was successfully created.' }
#        format.json { render :show, status: :created, location: @prof_picture }
#      else
#        format.html { render :new }
#        format.json { render json: @prof_picture.errors, status: :unprocessable_entity }
#      end
#    end
#  end
#
#  # PATCH/PUT /prof_pictures/1
#  # PATCH/PUT /prof_pictures/1.json
#  def update
#    respond_to do |format|
#      if @prof_picture.update(prof_picture_params)
#        format.html { redirect_to @prof_picture, notice: 'Prof picture was successfully updated.' }
#        format.json { render :show, status: :ok, location: @prof_picture }
#      else
#        format.html { render :edit }
#        format.json { render json: @prof_picture.errors, status: :unprocessable_entity }
#      end
#    end
#  end
#
#  # DELETE /prof_pictures/1
#  # DELETE /prof_pictures/1.json
#  end
#
#  private
#    # Use callbacks to share common setup or constraints between actions.
#    def set_prof_picture
#      @prof_picture = ProfPicture.find(params[:id])
#    end
#
#    # Never trust parameters from the scary internet, only allow the white list through.
#end
