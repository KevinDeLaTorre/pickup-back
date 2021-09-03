class CreateEventLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :event_links do |t|
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
    add_index :event_links, :user_id
    add_index :event_links, :event_id
    add_index :event_links, [:user_id, :event_id], unique: true
  end
end
