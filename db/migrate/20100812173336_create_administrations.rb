class CreateAdministrations < ActiveRecord::Migration
  def self.up
    create_table :administrations do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :administrations
  end
end
