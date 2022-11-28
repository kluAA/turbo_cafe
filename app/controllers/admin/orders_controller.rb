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

    def transition_in_progress
      @order = current_order
      if @order.update(status: ::Orders::Statuses::IN_PROGRESS)
        redirect_to admin_order_path(@order)
      else
        redirect_to admin_order_path(@order), alert: 'Failed to transition'
      end
    end

    def transition_completed
      @order = current_order
      if @order.update(status: ::Orders::Statuses::COMPLETED)
        redirect_to admin_order_path(@order)
      else
        redirect_to admin_order_path(@order), alert: 'Failed to transition'
      end
    end

    private

    def current_order
      @current_order ||= Order.find(params[:id])
    end
  end
end
