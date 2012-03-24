require 'spec_helper'

describe "histories/edit.html.erb" do
  before(:each) do
    @history = assign(:history, stub_model(History,
      :light_id => 1,
      :device_id => 1,
      :location_id => 1,
      :time => ""
    ))
  end

  it "renders the edit history form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => histories_path(@history), :method => "post" do
      assert_select "input#history_light_id", :name => "history[light_id]"
      assert_select "input#history_device_id", :name => "history[device_id]"
      assert_select "input#history_location_id", :name => "history[location_id]"
      assert_select "input#history_time", :name => "history[time]"
    end
  end
end
