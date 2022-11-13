# frozen_string_literal: true

class CreateSpecialItems < ActiveRecord::Migration[7.0]
  def change
    create_table :special_items do |t|
      t.references :item, foreign_key: true
      t.references :special, foreign_key: true
      t.timestamps
    end
  end
end
