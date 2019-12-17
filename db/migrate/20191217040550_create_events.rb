class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.text :people
      t.string :location
      t.time :start_time
      t.time :end_time
      t.date :date
      t.string :category

      t.timestamps
    end
  end
end
