# frozen_string_literal: true

class CreateWorkers < ActiveRecord::Migration[6.1]
  def change
    create_table :workers do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.decimal :hourly_rate, precision: 8, scale: 2

      t.timestamps
    end
  end
end
