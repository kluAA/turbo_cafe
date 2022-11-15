# frozen_string_literal: true

module OrderEntries
  class CreateService
    attr_reader :item, :order_id, :quantity, :subtotal_cents

    def initialize(order_id:, item_id:, quantity:)
      @item = Item.find(item_id)
      @order_id = order_id
      @quantity = quantity
      @subtotal_cents = quantity * item.price_cents
    end

    def call
      tax_amount_cents = calculate_tax
      total_cents = subtotal_cents + tax_amount_cents

      OrderEntry.create!(item_id: item.id, order_id: order_id, quantity: quantity, subtotal_cents: subtotal_cents,
                         tax_amount_cents: tax_amount_cents, total_cents: total_cents)
    end

    private

    def calculate_tax
      return 0 unless item.taxable?

      (subtotal_cents * item.tax_rate).round(2)
    end
  end
end
