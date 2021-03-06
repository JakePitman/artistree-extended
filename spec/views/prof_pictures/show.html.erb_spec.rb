require 'rails_helper'

RSpec.describe "prof_pictures/show", type: :view do
  before(:each) do
    @prof_picture = assign(:prof_picture, ProfPicture.create!(
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
