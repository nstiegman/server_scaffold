require 'spec_helper'

describe "LayoutLinks" do

  it "should have a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "Home")
  end

  it "should have an About page at '/about'" do
    get '/about'
    response.should have_selector('title', :content => "About")
  end

  it "should have a Users page at '/users'" do
    get '/users'
    response.should have_selector('title', :content => "Users")
  end

  it "should have a Locations page at '/locations'" do
    get '/locations'
    response.should have_selector('title', :content => "Locations")
  end

  it "should have a Lights page at '/lights'" do
    get '/lights'
    response.should have_selector('title', :content => "Lights")
  end

  it "should have a Devices page at '/devices'" do
    get '/devices'
    response.should have_selector('title', :content => "Devices")
  end

  it "should have a History page at '/histories'" do
    get '/histories'
    response.should have_selector('title', :content => "History")
  end

  it "should have a signup page at '/signup'" do
    get '/signup'
    response.should have_selector('title', :content => "Sign up")
  end
end
