class CreateUserProjects < ActiveRecord::Migration
  create_table :users_projects, id: false do |t|
    t.belongs_to :users, index: true
    t.belongs_to :projects, index: true
  end
end
