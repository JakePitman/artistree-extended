require 'rails_helper'

RSpec.describe "portfolio_pictures/index", type: :view do
  before(:each) do
    assign(:portfolio_pictures, [
      PortfolioPicture.create!(
        :image_data => "MyText",
        :profile => nil,
        :style => nil,
        :description => "MyText"
      ),
      PortfolioPicture.create!(
        :image_data => "MyText",
        :profile => nil,
        :style => nil,
        :description => "MyText"
      )
    ])
  end

  it "renders a list of portfolio_pictures" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
