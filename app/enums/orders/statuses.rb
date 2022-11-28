# frozen_string_literal: true

module Orders
  module Statuses
    ALL_STATUSES = [
      COMPLETED = 'completed',
      CONFIRMED_PAYMENT = 'confirmed_payment',
      IN_PROGRESS = 'in_progress',
      NEW = 'new'
    ].freeze

    PRETTY_STATUS = {
      COMPLETED => 'Completed',
      CONFIRMED_PAYMENT => 'Payment Confirmed',
      IN_PROGRESS => 'In Progress',
      NEW => 'New Order'
    }.freeze
  end
end
