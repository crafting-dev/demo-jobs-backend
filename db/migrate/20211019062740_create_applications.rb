# frozen_string_literal: true

class CreateApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :applications do |t|
      t.text :content, null: false
      t.string :status, null: false, default: 'applied'
      t.belongs_to :posting, null: false, foreign_key: true
      t.belongs_to :worker, null: false, foreign_key: true

      t.timestamps
    end
  end
end
