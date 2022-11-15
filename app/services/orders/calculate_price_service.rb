# frozen_string_literal: true

module Orders
  class CalculatePriceService
    attr_reader :order

    def initialize(order:)
      @order = order
    end

    def call
      subtotal, tax_amount, total = sum_order_entry_prices
      OpenStruct.new(subtotal: Money.new(subtotal), tax_amount: Money.new(tax_amount), total: Money.new(total))
    end

    def sum_order_entry_prices
      subtotal_sql_str = Arel.sql('sum(subtotal_cents)')
      tax_amount_sql_str = Arel.sql('sum(tax_amount_cents)')
      total_sql_str = Arel.sql('sum(total_cents)')

      order.order_entries.pluck(subtotal_sql_str, tax_amount_sql_str, total_sql_str).flatten
    end
  end
end
