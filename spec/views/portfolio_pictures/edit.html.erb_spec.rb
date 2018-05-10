require 'rails_helper'

RSpec.describe "portfolio_pictures/edit", type: :view do
  before(:each) do
    @portfolio_picture = assign(:portfolio_picture, PortfolioPicture.create!(
      :image_data => "MyText",
      :profile => nil,
      :style => nil,
      :description => "MyText"
    ))
  end

  it "renders the edit portfolio_picture form" do
    render

    assert_select "form[action=?][method=?]", portfolio_picture_path(@portfolio_picture), "post" do

      assert_select "textarea[name=?]", "portfolio_picture[image_data]"

      assert_select "input[name=?]", "portfolio_picture[profile_id]"

      assert_select "input[name=?]", "portfolio_picture[style_id]"

      assert_select "textarea[name=?]", "portfolio_picture[description]"
    end
  end
end
