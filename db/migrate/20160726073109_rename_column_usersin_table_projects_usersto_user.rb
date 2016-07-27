class RenameColumnUsersinTableProjectsUserstoUser < ActiveRecord::Migration
  def up
    rename_column :projects_users ,:users_id, :user_id
    rename_column :projects_users ,:projects_id , :project_id
  end

  def down
  end
end
