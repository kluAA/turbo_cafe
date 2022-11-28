# frozen_string_literal: true

class AddNameToOrderEntries < ActiveRecord::Migration[7.0]
  def change
    add_column :order_entries, :name, :string
  end
end
