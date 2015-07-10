egerclass CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :user_id
      t.boolean :private, default: false

      t.timestamps null: false
    end
  end
end
