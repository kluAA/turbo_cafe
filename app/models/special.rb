# frozen_string_literal: true

class Special < ApplicationRecord
  # == Callbacks ==================================================
  before_validation { set_slug if name.present? && slug.nil? }

  # == Validations ==================================================
  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true

  # == Associations ==================================================
  belongs_to :category, inverse_of: :specials
  has_many :special_items, inverse_of: :special
  has_many :items, through: :special_items

  # == Methods ==================================================

  private

  def set_slug
    self.slug = name.downcase.tr(' ', '_')
  end
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
