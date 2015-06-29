class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.text :title
      t.boolean :completed, default: false
      t.integer :category_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
