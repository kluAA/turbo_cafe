# frozen_string_literal: true

class OrderEntry < ApplicationRecord
  validates :quantity, presence: true

  monetize :subtotal_cents, numericality: { greater_than_or_equal_to: 0 }
  monetize :tax_amount_cents, numericality: { greater_than_or_equal_to: 0 }
  monetize :total_cents, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :order, inverse_of: :order_entries
  belongs_to :special, inverse_of: :order_entry, optional: true
  belongs_to :item, optional: true
end

# == Schema Information
#
# Table name: order_entries
#
#  id                  :bigint           not null, primary key
#  quantity            :integer          not null
#  subtotal_cents      :integer          default(0), not null
#  subtotal_currency   :string           default("USD"), not null
#  tax_amount_cents    :integer          default(0), not null
#  tax_amount_currency :string           default("USD"), not null
#  total_cents         :integer          default(0), not null
#  total_currency      :string           default("USD"), not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  item_id             :bigint           indexed
#  order_id            :bigint           indexed
#  special_id          :bigint           indexed
#
# Indexes
#
#  index_order_entries_on_item_id     (item_id)
#  index_order_entries_on_order_id    (order_id)
#  index_order_entries_on_special_id  (special_id)
#
# Foreign Keys
#
#  fk_rails_...  (item_id => items.id)
#  fk_rails_...  (order_id => orders.id)
#  fk_rails_...  (special_id => specials.id)
#
