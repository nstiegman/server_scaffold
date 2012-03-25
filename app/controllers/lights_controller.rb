class LightsController < ApplicationController
  # GET /lights
  # GET /lights.xml
  def index
    @lights = Light.all
    @title = "Lights"

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lights }
    end
  end

  # GET /lights/1
  # GET /lights/1.xml
  def show
    @light = Light.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @light }
    end
  end

  # GET /lights/new
  # GET /lights/new.xml
  def new
    @light = Light.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @light }
    end
  end

  # GET /lights/1/edit
  def edit
    @light = Light.find(params[:id])
  end

  # POST /lights
  # POST /lights.xml
  def create
    @light = Light.new(params[:light])

    respond_to do |format|
      if @light.save
        format.html { redirect_to(@light, :notice => 'Light was successfully created.') }
        format.xml  { render :xml => @light, :status => :created, :location => @light }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @light.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lights/1
  # PUT /lights/1.xml
  def update
    @light = Light.find(params[:id])

    respond_to do |format|
      if @light.update_attributes(params[:light])
        format.html { redirect_to(@light, :notice => 'Light was successfully updated.') }
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
    @light = Light.find(params[:id])
    @light.destroy

    respond_to do |format|
      format.html { redirect_to(lights_url) }
      format.xml  { head :ok }
    end
  end
end
