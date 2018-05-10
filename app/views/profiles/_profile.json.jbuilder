json.extract! profile, :id, :username, :street_address, :city, :state, :country_code, :postcode, :user_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)
