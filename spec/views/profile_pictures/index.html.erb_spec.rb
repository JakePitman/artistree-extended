require 'rails_helper'

RSpec.describe "profile_pictures/index", type: :view do
  before(:each) do
    assign(:profile_pictures, [
      ProfilePicture.create!(
        :image_data => "MyText",
        :profile => nil,
        :style => nil,
        :description => "MyText"
      ),
      ProfilePicture.create!(
        :image_data => "MyText",
        :profile => nil,
        :style => nil,
        :description => "MyText"
      )
    ])
  end

  it "renders a list of profile_pictures" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
