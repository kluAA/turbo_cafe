# frozen_string_literal: true

class Item < ApplicationRecord
  # == Callbacks ==================================================
  before_validation { set_slug if name.present? && slug.nil? }

  # == Validations ================================================
  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true
  monetize :price_cents, numericality: { greater_than_or_equal_to: 0 }

  # == Associations ===============================================
  belongs_to :category, inverse_of: :items

  has_many :special_items, inverse_of: :item

  # == Methods ====================================================
  private

  def set_slug
    self.slug = name.downcase.tr(' ', '_')
  end
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
#  tax_rate       :decimal(5, 5)
#  taxable        :boolean          default(TRUE), not null, indexed
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
