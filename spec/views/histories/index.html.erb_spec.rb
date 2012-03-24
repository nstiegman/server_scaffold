require 'spec_helper'

describe "histories/index.html.erb" do
  before(:each) do
    assign(:histories, [
      stub_model(History,
        :light_id => 1,
        :device_id => 1,
        :location_id => 1,
        :time => ""
      ),
      stub_model(History,
        :light_id => 1,
        :device_id => 1,
        :location_id => 1,
        :time => ""
      )
    ])
  end

  it "renders a list of histories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
