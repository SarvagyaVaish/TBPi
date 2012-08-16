class ChangeSemesterColumnEndToStop < ActiveRecord::Migration
  def up
    rename_column :semesters, :end, :end_dt
    rename_column :semesters, :start, :start_dt
    rename_column :events, :end, :end_dt
    rename_column :events, :start, :start_dt
  end

  def down
  end
end
