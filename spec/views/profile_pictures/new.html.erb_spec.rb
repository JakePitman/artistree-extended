require 'rails_helper'

RSpec.describe "profile_pictures/new", type: :view do
  before(:each) do
    assign(:profile_picture, ProfilePicture.new(
      :image_data => "MyText",
      :profile => nil,
      :style => nil,
      :description => "MyText"
    ))
  end

  it "renders new profile_picture form" do
    render

    assert_select "form[action=?][method=?]", profile_pictures_path, "post" do

      assert_select "textarea[name=?]", "profile_picture[image_data]"

      assert_select "input[name=?]", "profile_picture[profile_id]"

      assert_select "input[name=?]", "profile_picture[style_id]"

      assert_select "textarea[name=?]", "profile_picture[description]"
    end
  end
end
