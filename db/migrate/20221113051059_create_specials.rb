# frozen_string_literal: true

class CreateSpecials < ActiveRecord::Migration[7.0]
  def change
    create_table :specials do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.string :description
      t.monetize :price
      t.decimal :tax_rate, precision: 5, scale: 5
      t.boolean :taxable, index: true, default: true, null: false

      t.index :slug, unique: true
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
