class LightsController < ApplicationController

  helper_method :sort_column, :sort_direction

  # GET /lights
  # GET /lights.xml
  def index
    # @lights = Light.all
    @title = "Lights"
    @location = Location.find(params[:location_id])
    #@lights = @location.lights.all
    @lights = Light.order(sort_column + " " + sort_direction)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lights }
      format.json  { render :json => @lights }
    end
  end

  # GET /lights/1
  # GET /lights/1.xml
  def show
    @location = Location.find(params[:location_id])
    @light = @location.lights.find(params[:id])
    # @light = Light.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @light }
      format.json  { render :json => @lights }
    end
  end
  
  # GET /lights/1/dragdrop
  def dragdrop
    @location = Location.find(params[:location_id])
    @light = @location.lights.find(params[:id])
    
    respond_to do |format|
      format.html # dragdrop.html.erb
      format.xml  { render :xml => @light }
      format.json  { render :json => @lights }
    end  
  end

  # GET /lights/new
  # GET /lights/new.xml
  def new
    # @light = Light.new
    @location = Location.find(params[:location_id])
    @light = @location.lights.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @light }
      format.json  { render :json => @lights }
    end
  end

  # GET /lights/1/edit
  def edit
    # @light = Light.find(params[:id])
    @location = Location.find(params[:location_id])
    @light = @location.lights.find(params[:id])    
  end

  # POST /lights
  # POST /lights.xml
  def create
    # @light = Light.new(params[:light])
    @location = Location.find(params[:location_id])
    @light = @location.lights.new(params[:light])
    
    respond_to do |format|
      if @light.save
        format.html { redirect_to([@location, @light], :notice => 'Light was successfully created.') }
        format.xml  { render :xml => @light, :status => :created, :location => @light }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @light.errors, :status => :unprocessable_entity }
        format.json  { render :json => @lights }
      end
    end
  end

  # PUT /lights/1
  # PUT /lights/1.xml
  def update
    # @light = Light.find(params[:id])
    @location = Location.find(params[:location_id])
    @light = @location.lights.find(params[:id])

    respond_to do |format|
      if @light.update_attributes(params[:light])
        format.html { redirect_to([@location, @light], :notice => 'Light was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @light.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lights/1
  # DELETE /lights/1.xml
  def destroy
    # @light = Light.find(params[:id])
    @location = Location.find(params[:location_id])
    @light = @location.lights.find(params[:id])
    @light.destroy

    respond_to do |format|
      format.html { redirect_to(location_lights_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def sort_column
    Light.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
end
