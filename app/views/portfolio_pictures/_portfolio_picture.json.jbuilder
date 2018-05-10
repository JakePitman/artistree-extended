json.extract! portfolio_picture, :id, :image_data, :profile_id, :style_id, :description, :created_at, :updated_at
json.url portfolio_picture_url(portfolio_picture, format: :json)
