# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Special do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: specials
#
#  id             :bigint           not null, primary key
#  description    :string
#  name           :string           not null
#  price_cents    :integer          default(0), not null
#  price_currency :string           default("USD"), not null
#  slug           :string           not null, indexed
#  tax_rate       :decimal(5, 5)
#  taxable        :boolean          default(TRUE), not null, indexed
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  category_id    :bigint           indexed
#
# Indexes
#
#  index_specials_on_category_id  (category_id)
#  index_specials_on_slug         (slug) UNIQUE
#  index_specials_on_taxable      (taxable)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
