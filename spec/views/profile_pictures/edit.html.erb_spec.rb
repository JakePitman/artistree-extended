require 'rails_helper'

RSpec.describe "profile_pictures/edit", type: :view do
  before(:each) do
    @profile_picture = assign(:profile_picture, ProfilePicture.create!(
      :image_data => "MyText",
      :profile => nil,
      :style => nil,
      :description => "MyText"
    ))
  end

  it "renders the edit profile_picture form" do
    render

    assert_select "form[action=?][method=?]", profile_picture_path(@profile_picture), "post" do

      assert_select "textarea[name=?]", "profile_picture[image_data]"

      assert_select "input[name=?]", "profile_picture[profile_id]"

      assert_select "input[name=?]", "profile_picture[style_id]"

      assert_select "textarea[name=?]", "profile_picture[description]"
    end
  end
end
