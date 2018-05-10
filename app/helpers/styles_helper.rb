module StylesHelper

    def get_three_artists_samples(style_arr)
        pictures = style_arr.map { |picture| picture }
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
