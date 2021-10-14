class CreateApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :applications do |t|
      t.integer :posting_id
      t.integer :worker_id
      t.text :content
      t.boolean :decision_made, default: false
      t.boolean :hired, default: false
      t.boolean :expired, default: false

      t.timestamps
    end
  end
end
