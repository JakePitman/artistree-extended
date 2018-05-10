json.extract! prof_picture, :id, :image_data, :profile_id, :style_id, :description, :created_at, :updated_at
json.url prof_picture_url(prof_picture, format: :json)
