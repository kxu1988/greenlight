class CreateChannels < ActiveRecord::Migration[5.2]
  def change
    create_table :channels do |t|
      t.string :name
      t.integer :number
      t.string :channel

      t.timestamps
    end
  end
end
