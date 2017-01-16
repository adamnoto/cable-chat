class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders, id: false do |t|
      t.string :id, null: false
      t.string :payment_type
      t.string :transaction_status

      t.timestamps
    end
  end
end
