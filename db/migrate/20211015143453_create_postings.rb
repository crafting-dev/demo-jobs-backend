# frozen_string_literal: true

class CreatePostings < ActiveRecord::Migration[6.1]
  def change
    create_table :postings do |t|
      t.string :title
      t.text :description
      t.integer :employer_id
      t.integer :hours
      t.string :status, default: 'posted'

      t.timestamps
    end
  end
end
