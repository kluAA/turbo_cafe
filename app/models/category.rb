# frozen_string_literal: true

class Category < ApplicationRecord
  validates :name, presence: true

  has_many :items, inverse_of: :category
  has_many :specials, inverse_of: :category
end

# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string           not null, indexed
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_categories_on_name  (name)
#
