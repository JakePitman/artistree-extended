require 'rails_helper'

RSpec.describe "profiles/new", type: :view do
  before(:each) do
    assign(:profile, Profile.new(
      :username => "MyString",
      :street_address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :country_code => "MyString",
      :postcode => "MyString",
      :user => nil
    ))
  end

  it "renders new profile form" do
    render

    assert_select "form[action=?][method=?]", profiles_path, "post" do

      assert_select "input[name=?]", "profile[username]"

      assert_select "input[name=?]", "profile[street_address]"

      assert_select "input[name=?]", "profile[city]"

      assert_select "input[name=?]", "profile[state]"

      assert_select "input[name=?]", "profile[country_code]"

      assert_select "input[name=?]", "profile[postcode]"

      assert_select "input[name=?]", "profile[user_id]"
    end
  end
end
