class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false, comment: '商品名'

      t.timestamps
    end
  end
end
