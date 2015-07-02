class AddLocationInformtationToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :country_code, :string
    add_column :goals, :state_code, :string
  end
end
