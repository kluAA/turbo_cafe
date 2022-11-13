# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SpecialItem do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: special_items
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  item_id    :bigint           indexed
#  special_id :bigint           indexed
#
# Indexes
#
#  index_special_items_on_item_id     (item_id)
#  index_special_items_on_special_id  (special_id)
#
# Foreign Keys
#
#  fk_rails_...  (item_id => items.id)
#  fk_rails_...  (special_id => specials.id)
#
