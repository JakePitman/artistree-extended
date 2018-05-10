require 'rails_helper'

RSpec.describe "profiles/show", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      :username => "Username",
      :street_address => "Street Address",
      :city => "City",
      :state => "State",
      :country_code => "Country Code",
      :postcode => "Postcode",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Street Address/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Country Code/)
    expect(rendered).to match(/Postcode/)
    expect(rendered).to match(//)
  end
end
