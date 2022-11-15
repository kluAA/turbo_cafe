# frozen_string_literal: true

class OrderEntriesController < ApplicationController
  def create
    # add error handling later
    @order_entry = ::OrderEntries::CreateService.new(item_id: create_params[:item_id], order_id: create_params[:order_id], quantity: 1).call

    pricing_struct = recalculate_price(order_id: @order_entry.order_id)
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [turbo_stream.append('order_entries', partial: 'orders/order_entry', locals: { order_entry: @order_entry }),
                              turbo_stream.replace('pricing', partial: 'orders/pricing', locals: { pricing: pricing_struct })]
      end
    end
  end

  def destroy
    # better practice/later refactor to nest in order
    # confirm entry is part of order or some form of authorization
    # for now proof of concept for turbo streams

    OrderEntry.destroy(params[:id])
    pricing_struct = recalculate_price(order_id: params[:order_id])
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [turbo_stream.remove("order_entry_#{params[:id]}"),
                              turbo_stream.replace('pricing', partial: 'orders/pricing', locals: { pricing: pricing_struct })]
      end
    end
  end

  private

  def recalculate_price(order_id:)
    order = Order.find(order_id)
    ::Orders::CalculatePriceService.new(order: order).call
  end

  def create_params
    params.permit(:item_id, :order_id)
  end
end
