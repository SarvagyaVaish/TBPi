class ChangeMemberStatusToRoleId < ActiveRecord::Migration
  def up
    remove_column :members, :status
    add_column :members, :role_id, :integer
  end

  def down
  end
end
