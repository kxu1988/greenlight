class ScreensController < ApplicationController
  def index
  end

  def edit
  end
  
  def add
  end

  def channels
    id = params[:id]
    @device = params[:name]
    channels_url = "http://119.253.35.41:10000/api/v1/device/channellist?serial=#{id}"
    result = JSON.parse(RestClient.get(channels_url))
    @channels = result['ChannelList']

    respond_to do |format|
      format.html
      format.js
    end
  end

  def all_device
    id = params[:id]
    devices_url = "http://119.253.35.41:10000/api/v1/device/list"
    result = JSON.parse(RestClient.get(devices_url))
    @devices = result['DeviceList']

    respond_to do |format|
        format.html
        format.js
    end
  end

end
  