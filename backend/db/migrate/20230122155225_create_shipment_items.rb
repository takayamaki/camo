class CreateShipmentItems < ActiveRecord::Migration[7.0]
  def change
    create_table :shipment_items do |t|
      t.references :shipment
      t.references :in_process
      t.integer :amount_in_cases, null: false

      t.timestamps
    end
  end
end
