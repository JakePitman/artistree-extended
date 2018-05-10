require 'rails_helper'

RSpec.describe "prof_pictures/edit", type: :view do
  before(:each) do
    @prof_picture = assign(:prof_picture, ProfPicture.create!(
      :image_data => "MyText",
      :profile => nil,
      :style => nil,
      :description => "MyText"
    ))
  end

  it "renders the edit prof_picture form" do
    render

    assert_select "form[action=?][method=?]", prof_picture_path(@prof_picture), "post" do

      assert_select "textarea[name=?]", "prof_picture[image_data]"

      assert_select "input[name=?]", "prof_picture[profile_id]"

      assert_select "input[name=?]", "prof_picture[style_id]"

      assert_select "textarea[name=?]", "prof_picture[description]"
    end
  end
end
