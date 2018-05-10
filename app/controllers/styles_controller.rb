class StylesController < ApplicationController
  def index
      @styles = Style.all.order(:style_name)
  end

  def show
      @style = Style.find(params[:id])
  end
end
