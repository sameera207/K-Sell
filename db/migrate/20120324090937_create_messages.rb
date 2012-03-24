class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :phone_number
      t.float :latitude
      t.float :longitude
      t.string :type
      t.integer :qty
      t.text :msg
      t.float :price
      t.string :city
      t.timestamps
    end
  end
end
