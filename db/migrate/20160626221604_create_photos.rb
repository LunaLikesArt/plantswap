class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :picture
      t.text :caption
      t.integer :plant_id

      t.timestamps
    end
  end
end
