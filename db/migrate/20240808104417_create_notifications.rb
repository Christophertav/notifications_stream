class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.text :content
      t.string :title
      t.references :user, null: false, foreign_key: true
      t.integer :notification_type, default: 0

      t.timestamps
    end
  end
end
