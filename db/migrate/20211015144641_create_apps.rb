# frozen_string_literal: true

class CreateApps < ActiveRecord::Migration[6.1]
  def change
    create_table :apps do |t|
      t.integer :posting_id
      t.integer :worker_id
      t.text :content
      t.string :status, default: 'applied'

      t.timestamps
    end
  end
end
