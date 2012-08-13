class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :gtid
      t.string :status

      t.timestamps
    end
  end
end
