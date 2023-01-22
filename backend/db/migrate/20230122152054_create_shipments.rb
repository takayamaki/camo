class CreateShipments < ActiveRecord::Migration[7.0]
  def change
    create_table :shipments do |t|
      t.references :customer
      t.datetime :shipped_at

      t.timestamps
    end
  end
end
