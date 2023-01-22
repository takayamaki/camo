class CreateCustomer < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name, null: false, comment: '顧客名'

      t.timestamps
    end
  end
end
