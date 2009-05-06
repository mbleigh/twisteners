class AddLastProcessedToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :last_processed_at, :datetime
    add_column :users, :last_processed_id, :integer, :default => 1
  end

  def self.down
    remove_column :users, :last_processed_id
    remove_column :users, :last_processed_at
  end
end
