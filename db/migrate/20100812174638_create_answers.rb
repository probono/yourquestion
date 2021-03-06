class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.text :body
      t.references :question
      t.text :email
      t.string :name
      t.string :email
      t.integer :votes_count, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :answers
  end
end
