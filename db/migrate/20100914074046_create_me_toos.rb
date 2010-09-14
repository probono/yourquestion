class CreateMeToos < ActiveRecord::Migration
  def self.up
    create_table :me_toos do |t|
      t.references :question
      t.string :user_agent
      t.string :ip
      t.string :referer
      t.string :session_id
      t.string :request_hash

      t.timestamps
    end
  end

  def self.down
    drop_table :me_toos
  end
end
