class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.string :title
      t.text :body
      t.datetime :answered_at
      t.datetime :sent_at
      t.references :administration
      t.references :department
      t.string :name
      t.string :email
      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
