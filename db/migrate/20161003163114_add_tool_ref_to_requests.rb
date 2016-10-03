class AddToolRefToRequests < ActiveRecord::Migration[5.0]
  def change
    add_reference :requests, :tool, foreign_key: true
  end
end
