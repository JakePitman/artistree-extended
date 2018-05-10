module UsersHelper

    def get_three_samples(artist)
        pictures = artist.prof_pictures.map { |picture| picture }
        picture_reel = []
        3.times do 
            picture = pictures.sample 
            unless picture.nil?
                pictures.delete(picture)
                picture_reel << picture
            end
        end
        picture_reel
    end

end
