class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name, null: false, limit: 255
      t.string :email, null: false, limit: 255

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
