# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category do
  pending "add some examples to (or delete) #{__FILE__}"
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
