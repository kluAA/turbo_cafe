# frozen_string_literal: true

class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(create_params)
    if @order.save
      redirect_to edit_order_path(status_tracking_slug: @order.status_tracking_slug)
    else
      flash.now[:alert] = @order.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    verify_order_status_new
    return if performed?

    @order = current_order
    @order_entries = current_order.order_entries
    @specials = Special.includes(:category, :items).where(category: { name: 'specials' })
    @drinks = Item.includes(:category).where(category: { name: 'drinks' })
    @sandwiches = Item.includes(:category).where(category: { name: 'sandwiches' })
    @desserts = Item.includes(:category).where(category: { name: 'desserts' })
    @pricing_struct = ::Orders::CalculatePriceService.new(order: @order).call
  end

  def finalize
    verify_order_entries_present
    return if performed?

    @order = current_order
    @pricing_struct = ::Orders::CalculatePriceService.new(order: @order).call
    if @order.update(
      status: ::Orders::Statuses::CONFIRMED_PAYMENT,
      subtotal: @pricing_struct.subtotal,
      tax_amount: @pricing_struct.tax_amount,
      total: @pricing_struct.total
    )
      redirect_to status_order_path(status_tracking_slug: @order.status_tracking_slug)
    else
      redirect_to edit_order_path(status_tracking_slug: @order.status_tracking_slug), alert: 'Failed to finalize order'
    end
  end

  def status
    @order = current_order
  end

  private

  def create_params
    params.require(:order).permit(:first_name, :last_name)
  end

  def current_order
    @current_order ||= Order.find_by!(status_tracking_slug: params[:status_tracking_slug])
  end

  def verify_order_status_new
    return if current_order.new?

    redirect_to status_order_path(status_tracking_slug: current_order.status_tracking_slug)
  end

  def verify_order_entries_present
    return unless current_order.order_entries.empty?

    redirect_to edit_order_path(status_tracking_slug: current_order.status_tracking_slug), alert: 'You must select at least one item from the menu.'
  end
end
