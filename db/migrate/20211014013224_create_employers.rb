class CreateEmployers < ActiveRecord::Migration[6.1]
  def change
    create_table :employers do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :location

      t.timestamps
    end
    add_index :employers, :email, unique: true
  end
end
