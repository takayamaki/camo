class CreateOrder < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :customer
      t.datetime :ordered_at

      t.timestamps
    end
  end
end
