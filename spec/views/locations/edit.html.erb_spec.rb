require 'spec_helper'

describe "locations/edit.html.erb" do
  before(:each) do
    @location = assign(:location, stub_model(Location,
      :location_id => 1,
      :latitude => "9.99",
      :longitude => "9.99",
      :map => "",
      :name => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit location form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => locations_path(@location), :method => "post" do
      #assert_select "input#location_location_id", :name => "location[location_id]"
      assert_select "input#location_latitude", :name => "location[latitude]"
      assert_select "input#location_longitude", :name => "location[longitude]"
      assert_select "input#location_map", :name => "location[map]"
      assert_select "input#location_name", :name => "location[name]"
      #assert_select "input#location_email", :name => "location[email]"
    end
  end
end
