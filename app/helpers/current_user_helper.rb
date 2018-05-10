module CurrentUserHelper
    def full_address(profile)
        "#{profile.street_address}, #{profile.city}, #{profile.state}, #{profile.country_code}"
    end
end
