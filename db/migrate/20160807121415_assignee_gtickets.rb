class AssigneeGtickets < ActiveRecord::Migration
  create_table :assignee_gtickets do |t|
    t.belongs_to :user, index: true
    t.has_many :tickets, index: true

    end
end
