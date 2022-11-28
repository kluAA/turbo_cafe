# frozen_string_literal: true

module OrderEntries
  class CreateService
    attr_reader :item_id, :order_id, :quantity, :special_id, :subtotal_cents

    def initialize(order_id:, quantity:, item_id: nil, special_id: nil)
      @item_id = item_id
      @order_id = order_id
      @quantity = quantity
      @special_id = special_id
      @subtotal_cents = quantity * product.price_cents
    end

    def call
      tax_amount_cents = calculate_tax
      total_cents = subtotal_cents + tax_amount_cents

      OrderEntry.create!(item_id: item_id, name: product.name, order_id: order_id, quantity: quantity, special_id: special_id,
                         subtotal_cents: subtotal_cents, tax_amount_cents: tax_amount_cents, total_cents: total_cents)
    end

    private

    def calculate_tax
      return 0 unless product.taxable?

      (subtotal_cents * product.tax_rate).round(2)
    end

    def product
      @product ||= item_id.present? ? Item.find(item_id) : Special.find(special_id)
    end
  end
end
