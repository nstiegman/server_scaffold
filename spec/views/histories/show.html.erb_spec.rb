require 'spec_helper'

describe "histories/show.html.erb" do
  before(:each) do
    @history = assign(:history, stub_model(History,
      :light_id => 1,
      :device_id => 1,
      :location_id => 1,
      :time => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
