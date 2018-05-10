class StylesController < ApplicationController
  def index
      if params[:search]
          @styles = Style.where(['LOWER(style_name) LIKE ?', "%#{params[:search]}%"])
      else
          @styles = Style.all.order(:style_name)
      end
  end

  def show
      @style = Style.find(params[:id])
  end

  def add_styles
      @styles = Style.all.order(:style_name)
      current_user.update
  end
end
