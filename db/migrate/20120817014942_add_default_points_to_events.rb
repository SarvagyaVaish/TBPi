class AddDefaultPointsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :default_points, :integer
  end
end
