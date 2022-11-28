# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrderEntry do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: order_entries
#
#  id                  :bigint           not null, primary key
#  name                :string
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
