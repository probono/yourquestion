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
      t.integer :me_toos_count, :default => 0
      t.integer :days_to_answer
      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
