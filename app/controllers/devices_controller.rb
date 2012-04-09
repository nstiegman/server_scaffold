class DevicesController < ApplicationController

  helper_method :sort_column, :sort_direction
  
  # GET /devices
  # GET /devices.xml
  def index
    #@devices = Device.all
    @devices = Device.order(sort_column + " " + sort_direction)
    @title = "Devices"

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @devices }
    end
  end

  # GET /devices/1
  # GET /devices/1.xml
  def show
    @device = Device.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @device }
    end
  end

  # GET /devices/new
  # GET /devices/new.xml
  def new
    @device = Device.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @device }
    end
  end

  # GET /devices/1/edit
  def edit
    @device = Device.find(params[:id])
  end

  # POST /devices
  # POST /devices.xml
  def create
    #Device.destroy_all(:device_id => params[:device_id])
    #deletable_words = [ 'php', 'c++' ]
    #objs = Device.find(:all, :conditions => [ "Devices.device_id IN (?)",  deletable_words])
    #objs.each { |o| o.destroy }
    @device = Device.new(params[:device])
    @history = History.new(:light_id => @device.light_id, :device_id => @device.device_id, :location_id => @device.location_id)
    @history.save
    
        Device.destroy_all(:device_id => @device.device_id)

    
    respond_to do |format|
      if @device.save
        # Fetch your latest record
        #newest_device = Device.find(:all, :conditions => { :device_id => @device.device_id }, :order => 'created_at DESC', :limit => 1)
        # 
        #objs = Device.find(:all, :conditions => ['device_id = ? and "devices.id NOT IN (?)"', @device.device_id, newest_device.collect(&:device_id)])
        
        #objs.each { |o| o.destroy }



        # Delete all but newest
        #Device.destroy_all(:device_id => @device.device_id, ['id NOT IN (?)', newest_record.collect(&:id)])
        
        format.html { redirect_to(@device, :notice => 'Device was successfully created.') }
        format.xml  { render :xml => @device, :status => :created, :location => @device }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @device.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /devices/1
  # PUT /devices/1.xml
  def update
    @device = Device.find(params[:id])


    respond_to do |format|
      if @device.update_attributes(params[:device])
        format.html { redirect_to(@device, :notice => 'Device was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @device.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /devices/1
  # DELETE /devices/1.xml
  def destroy
    @device = Device.find(params[:id])
    @device.destroy

    respond_to do |format|
      format.html { redirect_to(devices_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def sort_column
    Device.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
end
