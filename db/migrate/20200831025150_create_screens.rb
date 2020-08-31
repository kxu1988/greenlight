class CreateScreens < ActiveRecord::Migration[5.2]
  def change
    create_table :screens do |t|
      t.string :name
      t.integer :number
      t.string :device

      t.timestamps
    end
  end
end
