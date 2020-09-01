class ScreensController < ApplicationController
  def index
    @screen_1= Screen.find_by(number:1)
    @screen_2= Screen.find_by(number:2)
    @screen_3= Screen.find_by(number:3)
    @screen_4= Screen.find_by(number:4)
    @screen_5= Screen.find_by(number:5)
    @screen_6= Screen.find_by(number:6)
    @screen_7= Screen.find_by(number:7)
    @screen_8= Screen.find_by(number:8)
    @screen_9= Screen.find_by(number:9)
  end

  def update
    screen_id = params[:id]
    channels = JSON.parse(params[:channels])

    screen = Screen.find_or_create_by(number:screen_id)
    screen.name = params[:device_name]
    screen.save

    Channel.where(number:screen_id).destroy_all

    channels.each do |channel|
      id = channel["id"]
      device = channel["device"]
      channel = Channel.new
      channel.number = screen_id
      channel.channel = id
      channel.name = device
      channel.save
    end

    @result = 1

    respond_to do |format|
      format.json { render :xml => @result.to_json }
    end
  end
  
  def add
  end

  def channels
    @device_id = params[:id]
    @device = params[:name]
    channels_url = "http://119.253.35.41:10000/api/v1/device/channellist?serial=#{@device_id}"
    result = JSON.parse(RestClient.get(channels_url))
    @channels = result['ChannelList']

    respond_to do |format|
      format.html
      format.js
    end
  end

  def all_device
    @id = params[:id]
    devices_url = "http://119.253.35.41:10000/api/v1/device/list"
    result = JSON.parse(RestClient.get(devices_url))
    @devices = result['DeviceList']

    respond_to do |format|
        format.html
        format.js
    end
  end

end
  