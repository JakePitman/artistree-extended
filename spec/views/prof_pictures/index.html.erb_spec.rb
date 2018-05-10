require 'rails_helper'

RSpec.describe "prof_pictures/index", type: :view do
  before(:each) do
    assign(:prof_pictures, [
      ProfPicture.create!(
        :image_data => "MyText",
        :profile => nil,
        :style => nil,
        :description => "MyText"
      ),
      ProfPicture.create!(
        :image_data => "MyText",
        :profile => nil,
        :style => nil,
        :description => "MyText"
      )
    ])
  end

  it "renders a list of prof_pictures" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
