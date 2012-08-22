class AddGtusernameToMembers < ActiveRecord::Migration
  def change
    add_column :members, :gtusername, :string
  end
end
