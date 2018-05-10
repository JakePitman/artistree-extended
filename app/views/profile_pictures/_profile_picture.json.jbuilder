json.extract! profile_picture, :id, :image_data, :profile_id, :style_id, :description, :created_at, :updated_at
json.url profile_picture_url(profile_picture, format: :json)
