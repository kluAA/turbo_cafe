# frozen_string_literal: true

class CreateOrderEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :order_entries do |t|
      t.integer :quantity, null: false
      t.monetize :subtotal
      t.monetize :tax_amount
      t.monetize :total

      t.references :order, foreign_key: true
      t.references :item, foreign_key: true
      t.references :special, foreign_key: true
      t.timestamps
    end
  end
end
