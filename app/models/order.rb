# frozen_string_literal: true

class Order < ApplicationRecord
  include Turbo::Broadcastable
  # == Callbacks ====================================================
  before_create :set_status_tracking_slug
  after_update_commit -> { broadcast_replace_later_to 'orders', partial: 'orders/current_status', locals: { order: self } }

  # == Validations ==================================================
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :status, inclusion: { in: ::Orders::Statuses::ALL_STATUSES }

  monetize :subtotal_cents, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  monetize :tax_amount_cents, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  monetize :total_cents, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  # == Associations ==================================================
  has_many :order_entries, inverse_of: :order

  # == Methods =======================================================
  def new?
    status == ::Orders::Statuses::NEW
  end

  def pretty_status
    ::Orders::Statuses::PRETTY_STATUS[status]
  end

  private

  def set_status_tracking_slug
    self.status_tracking_slug = SecureRandom.urlsafe_base64
  end
end

# == Schema Information
#
# Table name: orders
#
#  id                   :bigint           not null, primary key
#  first_name           :string           not null
#  last_name            :string           not null
#  status               :string           default("new"), not null, indexed
#  status_tracking_slug :string           not null, indexed
#  subtotal_cents       :integer
#  subtotal_currency    :string           default("USD"), not null
#  tax_amount_cents     :integer
#  tax_amount_currency  :string           default("USD"), not null
#  total_cents          :integer
#  total_currency       :string           default("USD"), not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_orders_on_status                (status)
#  index_orders_on_status_tracking_slug  (status_tracking_slug) UNIQUE
#
