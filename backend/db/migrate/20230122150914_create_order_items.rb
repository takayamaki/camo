class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.references :order
      t.references :product
      t.integer :amount_in_cases, null: false

      t.timestamps
    end
  end
end
