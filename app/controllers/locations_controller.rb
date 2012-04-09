class LocationsController < ApplicationController

  helper_method :sort_column, :sort_direction
  
  # GET /locations
  # GET /locations.xml
  def index
    #@locations = Location.search(params[:search])
    @locations = Location.order(sort_column + " " + sort_direction)
    @title = "Locations"

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @locations }
      format.json  { render :json => @locations }
    end
  end
  
  # GET /locations/1/indoor
  # GET /locations/1/indoor.xml
  def indoor
    @location = Location.find(params[:id])
    @lights = @location.lights.all
    
    respond_to do |format|
      format.html # indoor.html.erb
      format.xml  { render :xml => @lights }
      format.json  { render :json => @lights }
    end  
  end

  # GET /locations/1
  # GET /locations/1.xml
  def show
    @location = Location.find(params[:id])
    @lights = @location.lights.all

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @location }
      format.json  { render :json => @location }
    end
  end
  
  # GET /locations/new
  # GET /locations/new.xml
  def new
    @location = Location.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @location }
    end
  end

  # GET /locations/1/edit
  def edit
    @location = Location.find(params[:id])
  end

  # POST /locations
  # POST /locations.xml
  def create
    @location = Location.new(params[:location])
    
    respond_to do |format|
      if @location.save
        format.html { redirect_to(@location, :notice => 'Location was successfully created.') }
        format.xml  { render :xml => @location, :status => :created, :location => @location }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /locations/1
  # PUT /locations/1.xml
  def update
    @location = Location.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(params[:location])
        format.html { redirect_to(@location, :notice => 'Location was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.xml
  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to(locations_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def sort_column
    Location.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end  
end
