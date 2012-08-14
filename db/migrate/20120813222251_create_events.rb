class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :start
      t.datetime :end
      t.integer :event_type_id
      t.integer :semester_id

      t.timestamps
    end
  end
end
