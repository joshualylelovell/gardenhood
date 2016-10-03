class AddGardenerRefToRequests < ActiveRecord::Migration[5.0]
  def change
    add_reference :requests, :gardener, foreign_key: true
  end
end
