require 'spec_helper'

describe "devices/index.html.erb" do
  before(:each) do
    assign(:devices, [
      stub_model(Device,
        :device_id => "Device",
        :location_id => 1,
        :light_id => 1
      ),
      stub_model(Device,
        :device_id => "Device",
        :location_id => 1,
        :light_id => 1
      )
    ])
  end

  it "renders a list of devices" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Device".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
