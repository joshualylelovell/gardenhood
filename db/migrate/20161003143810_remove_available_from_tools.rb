class RemoveAvailableFromTools < ActiveRecord::Migration[5.0]
  def change
    remove_column :tools, :available, :boolean
  end
end
