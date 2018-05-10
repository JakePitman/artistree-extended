require 'rails_helper'

RSpec.describe "profile_pictures/show", type: :view do
  before(:each) do
    @profile_picture = assign(:profile_picture, ProfilePicture.create!(
      :image_data => "MyText",
      :profile => nil,
      :style => nil,
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
  end
end
