require 'spec_helper'

describe "lights/index.html.erb" do
  before(:each) do
    assign(:lights, [
      stub_model(Light,
        :x_position => 1,
        :y_position => 1,
        :z_position => 1,
        :location_id => 1,
        :light_id => 1,
        :name => "Name",
        :content => ""
      ),
      stub_model(Light,
        :x_position => 1,
        :y_position => 1,
        :z_position => 1,
        :location_id => 1,
        :light_id => 1,
        :name => "Name",
        :content => ""
      )
    ])
  end

  it "renders a list of lights" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
