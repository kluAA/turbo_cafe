# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.text :description
      t.monetize :price
      t.monetize :tax
      t.boolean :taxable, index: true

      t.index :slug, unique: true
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
