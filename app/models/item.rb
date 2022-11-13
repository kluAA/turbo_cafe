# frozen_string_literal: true

class Item < ApplicationRecord
end

# == Schema Information
#
# Table name: items
#
#  id             :bigint           not null, primary key
#  description    :text
#  name           :string           not null
#  price_cents    :integer          default(0), not null
#  price_currency :string           default("USD"), not null
#  slug           :string           not null, indexed
#  tax_cents      :integer          default(0), not null
#  tax_currency   :string           default("USD"), not null
#  taxable        :boolean          indexed
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  category_id    :bigint           indexed
#
# Indexes
#
#  index_items_on_category_id  (category_id)
#  index_items_on_slug         (slug) UNIQUE
#  index_items_on_taxable      (taxable)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
