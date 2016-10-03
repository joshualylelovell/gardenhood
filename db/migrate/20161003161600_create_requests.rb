class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.date :start_date
      t.date :end_date
      t.string :notes
      t.string :status

      t.timestamps
    end
  end
end
