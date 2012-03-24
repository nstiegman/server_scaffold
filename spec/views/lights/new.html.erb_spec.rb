require 'spec_helper'

describe "lights/new.html.erb" do
  before(:each) do
    assign(:light, stub_model(Light,
      :x_position => 1,
      :y_position => 1,
      :z_position => 1,
      :location_id => 1,
      :light_id => 1,
      :name => "MyString",
      :content => ""
    ).as_new_record)
  end

  it "renders new light form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lights_path, :method => "post" do
      assert_select "input#light_x_position", :name => "light[x_position]"
      assert_select "input#light_y_position", :name => "light[y_position]"
      assert_select "input#light_z_position", :name => "light[z_position]"
      assert_select "input#light_location_id", :name => "light[location_id]"
      assert_select "input#light_light_id", :name => "light[light_id]"
      assert_select "input#light_name", :name => "light[name]"
      assert_select "input#light_content", :name => "light[content]"
    end
  end
end
