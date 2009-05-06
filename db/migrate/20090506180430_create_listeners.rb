class CreateListeners < ActiveRecord::Migration
  def self.up
    create_table :listeners do |t|
      t.integer :user_id
      t.string :screen_name
      t.string :profile_image_url
      t.integer :count

      t.timestamps
    end
  end

  def self.down
    drop_table :listeners
  end
end
