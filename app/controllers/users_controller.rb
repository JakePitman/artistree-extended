class UsersController < ApplicationController
  def index

      #GET SUGGESTED ARTISTS
      @suggested_artists = []
      mystyles = current_user.styles
      mystyles.each do |mystyle|
          User.all.each do |user|
              unless user.profile.nil? || @suggested_artists.include?(user) || user == current_user 
                  (@suggested_artists << user) if (user.profile.styles.include?(mystyle)) && (mystyle.prof_pictures.where(profile_id: user.id).empty? == false)
            end
          end
      end

  end

  def show
      @user = User.find(params[:id])
  end
end
