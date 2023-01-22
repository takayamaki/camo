class CreateInProcess < ActiveRecord::Migration[7.0]
  def change
    create_table :in_processes do |t|
      t.references :product
      t.datetime :start_at, comment: '入庫日'
      t.integer :amount_in_cases, comment: '入庫量(ケース単位)'

      t.timestamps
    end
  end
end
