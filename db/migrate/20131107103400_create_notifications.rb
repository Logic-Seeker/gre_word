class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :access_token

      t.timestamps
    end
  end
end
