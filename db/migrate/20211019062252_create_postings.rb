# frozen_string_literal: true

class CreatePostings < ActiveRecord::Migration[6.1]
  def change
    create_table :postings do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.belongs_to :employer, null: false, foreign_key: true
      t.integer :hours
      t.string :status, default: 'posted'

      t.timestamps
    end
  end
end
