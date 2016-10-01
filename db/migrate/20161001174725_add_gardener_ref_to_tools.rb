class AddGardenerRefToTools < ActiveRecord::Migration[5.0]
  def change
    add_reference :tools, :gardener, foreign_key: true
  end
end
