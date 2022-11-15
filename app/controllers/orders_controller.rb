# frozen_string_literal: true

class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(create_params)
    if @order.save
      redirect_to edit_order_path(slug: @order.status_tracking_slug)
    else
      flash.now[:alert] = @order.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  private

  def create_params
    params.require(:order).permit(:first_name, :last_name)
  end

  def current_order
    @current_order ||= Order.find_by(status_tracking_slug: params[:status_tracking_slug])
  end
end
