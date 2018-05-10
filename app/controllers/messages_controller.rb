class MessagesController < ApplicationController
  def show
      @message = Message.find(params[:id])
  end

  def new
      @message = Message.new
      render :new
  end

  def create
      @message = Message.new(message_params)
      @message.user = current_user
      if @message.save
          redirect_to requests_show_path(id: @message.request.id)
      else
        render :new
      end
  end

private
    def message_params
      params.require(:message).permit(:message_text, :user_id, :request_id)
    end

end
