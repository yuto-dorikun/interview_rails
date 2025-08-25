class CreateInterviews < ActiveRecord::Migration[7.1]
  def change
    create_table :interviews do |t|
      t.integer :category, null: false, default: 0
      t.string :title, null: false, limit: 255
      t.datetime :scheduled_at, null: false
      t.string :location, null: false, limit: 255
      t.text :notes, null: false
      t.references :user, null: false, foreign_key: true
      t.references :interviewee, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
