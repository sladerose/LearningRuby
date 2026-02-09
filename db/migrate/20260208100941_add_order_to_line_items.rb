class AddOrderToLineItems < ActiveRecord::Migration[8.1]
  def change
    add_reference :line_items, :order, null: true, foreign_key: true
    add_column :line_items, :price, :decimal, precision: 10, scale: 2
    change_column_null :line_items, :cart_id, true
  end
end
