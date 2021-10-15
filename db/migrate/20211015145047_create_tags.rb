# frozen_string_literal: true

class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :content
      t.references :taggable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
