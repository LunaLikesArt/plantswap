class AlterPlants < ActiveRecord::Migration
  def change

    add_column :plants, :name, :string
    add_column :plants, :description, :text
    add_column :plants, :city, :string
    add_column :plants, :state, :string
    add_column :plants, :user_id, :integer
    
    add_index :plants, :user_id

  end
end
