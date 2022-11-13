# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :status, null: false, index: true, default: 'new'
      t.string :status_tracking_slug, null: false
      t.monetize :subtotal, amount: { null: true, default: nil }
      t.monetize :tax_amount, amount: { null: true, default: nil }
      t.monetize :total, amount: { null: true, default: nil }

      t.index :status_tracking_slug, unique: true
      t.timestamps
    end
  end
end
