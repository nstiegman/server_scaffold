class PagesController < ApplicationController
  def home
    @title = "Home"
  end

  def about
    @title = "About"
  end
  
  def indoor
    @title = "Indoor Map"
  end

end
