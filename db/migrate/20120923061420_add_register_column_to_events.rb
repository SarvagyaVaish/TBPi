class AddRegisterColumnToEvents < ActiveRecord::Migration
  def change
    add_column :events, :registerable, :boolean
  end
end
