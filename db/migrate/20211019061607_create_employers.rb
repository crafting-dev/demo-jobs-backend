# frozen_string_literal: true

class CreateEmployers < ActiveRecord::Migration[6.1]
  def change
    create_table :employers do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :location

      t.timestamps
    end
    add_index :employers, :email, unique: true
  end
end
