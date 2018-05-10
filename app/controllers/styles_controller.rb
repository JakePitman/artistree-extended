class StylesController < ApplicationController
  def index
      @styles = Style.all.order(:style_name)
  end

  def show
      @style = Style.find(params[:id])
  end

  def add_styles
      @styles = Style.all.order(:style_name)
      current_user.update
  end
end
