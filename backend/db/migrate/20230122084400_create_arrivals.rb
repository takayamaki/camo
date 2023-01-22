class CreateArrivals < ActiveRecord::Migration[7.0]
  def change
    create_table :arrivals do |t|
      t.references :product
      t.datetime :arrived_at, comment: '入荷日'
      t.integer :amount_in_cases, comment: '入荷量(ケース単位)'

      t.timestamps
    end
  end
end
