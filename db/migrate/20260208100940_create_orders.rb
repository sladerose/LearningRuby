class CreateOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :orders do |t|
      t.string :email_address
      t.string :status
      t.decimal :total, precision: 10, scale: 2

      t.timestamps
    end
  end
end
