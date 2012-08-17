class AddPointsToAttendances < ActiveRecord::Migration
  def change
    add_column :attendances, :points, :integer
  end
end
