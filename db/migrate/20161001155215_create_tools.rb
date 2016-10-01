class CreateTools < ActiveRecord::Migration[5.0]
  def change
    create_table :tools do |t|
      t.string :name, null: false
      t.string :details, null: false
      t.boolean :available
      t.boolean :requested

      t.timestamps
    end
  end
end
