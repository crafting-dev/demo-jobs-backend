class CreatePostings < ActiveRecord::Migration[6.1]
  def change
    create_table :postings do |t|
      t.string :title
      t.text :description
      t.integer :employer_id
      t.integer :hours
      t.boolean :expired, default: false

      t.timestamps
    end
  end
end
