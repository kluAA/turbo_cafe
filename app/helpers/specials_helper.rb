# frozen_string_literal: true

module SpecialsHelper
  def self.discount_value(special:, items:)
    difference_cents = items.pluck(:price_cents).sum - special.price_cents
    Money.new(difference_cents)
  end
end
