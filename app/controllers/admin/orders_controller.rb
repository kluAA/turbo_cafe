# frozen_string_literal: true

module Admin
  class OrdersController < ApplicationController
    def index
      @orders =
        Order
        .all
        .order(created_at: :desc)
        .page(params[:page])
        .per(10)
    end

    def show
      @order = current_order
      @order_entries = @order.order_entries
    end

    private

    def current_order
      @current_order ||= Order.find(params[:id])
    end
  end
end
