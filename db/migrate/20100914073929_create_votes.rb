class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.references :answer
      t.string :user_agent
      t.string :ip
      t.string :referer
      t.string :session_id
      t.string :request_hash
      t.boolean :positive

      t.timestamps
    end
  end

  def self.down
    drop_table :votes
  end
end
