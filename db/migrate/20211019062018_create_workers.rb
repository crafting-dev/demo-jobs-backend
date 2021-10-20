# frozen_string_literal: true

class CreateWorkers < ActiveRecord::Migration[6.1]
  def change
    create_table :workers do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.decimal :hourly_rate, precision: 8, scale: 2

      t.timestamps
    end
    add_index :workers, :email, unique: true
  end
end
