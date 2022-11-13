# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: orders
#
#  id                   :bigint           not null, primary key
#  first_name           :string           not null
#  last_name            :string           not null
#  status               :string           default("new"), not null, indexed
#  status_tracking_slug :string           not null, indexed
#  subtotal_cents       :integer
#  subtotal_currency    :string           default("USD"), not null
#  tax_amount_cents     :integer
#  tax_amount_currency  :string           default("USD"), not null
#  total_cents          :integer
#  total_currency       :string           default("USD"), not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_orders_on_status                (status)
#  index_orders_on_status_tracking_slug  (status_tracking_slug) UNIQUE
#
