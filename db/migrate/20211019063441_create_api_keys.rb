# frozen_string_literal: true

class CreateApiKeys < ActiveRecord::Migration[6.1]
  def change
    create_table :api_keys do |t|
      t.string :token_digest, null: false
      t.references :bearer, polymorphic: true, null: false

      t.timestamps
    end
    add_index :api_keys, :token_digest, unique: true
  end
end
