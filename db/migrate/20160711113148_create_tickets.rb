class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :status
      t.integer :user_id
      t.string :title
      t.string :priority
      t.text :description
      t.string :type
      t.integer :project_id

      t.timestamps
    end
  end
end
