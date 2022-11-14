# frozen_string_literal: true

class SpecialItem < ApplicationRecord
  # == Associations ===============================================
  belongs_to :item, inverse_of: :special_items
  belongs_to :special, inverse_of: :special_items

  # == Methods ====================================================
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
