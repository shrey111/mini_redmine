class NticketsWatchers < ActiveRecord::Migration
   create_table :ntickets_watchers do |t|
    t.belongs_to :user, index: true
    t.belongs_to :ticket, index: true

    end
end
