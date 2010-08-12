class CreateDepartments < ActiveRecord::Migration
  def self.up
    create_table :departments do |t|
      t.string :name
      t.text :description
      t.references :administration
      t.string :phone
      t.text :address
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :departments
  end
end
