class AddDeviceToChannel < ActiveRecord::Migration[5.2]
  def change
    add_column :channels, :device, :string
  end
end
