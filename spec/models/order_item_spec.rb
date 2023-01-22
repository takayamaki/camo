# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrderItem do
  describe 'amount_in_cases' do
    it 'amount_in_casesが1以上の整数ならvalid' do
      customer = Customer.new(name: 'ミリオン商事')
      order = Order.new(customer:,
                        ordered_at: Time.zone.now)
      product = Product.new(name: 'バナナ')
      order_item = OrderItem.new(order:,
                                 product:,
                                 amount_in_cases: 1)

      expect(order_item).to be_valid
    end

    it 'amount_in_casesが0だとinvalid' do
      customer = Customer.new(name: 'ミリオン商事')
      order = Order.new(customer:,
                        ordered_at: Time.zone.now)
      product = Product.new(name: 'バナナ')
      order_item = OrderItem.new(order:,
                                 product:,
                                 amount_in_cases: 0)

      expect(order_item).to be_invalid
    end

    it 'amount_in_casesが整数でないとinvalid' do
      customer = Customer.new(name: 'ミリオン商事')
      order = Order.new(customer:,
                        ordered_at: Time.zone.now)
      product = Product.new(name: 'バナナ')
      order_item = OrderItem.new(order:,
                                 product:,
                                 amount_in_cases: 1.5)

      expect(order_item).to be_invalid
    end

    it 'amount_in_casesが空だとinvalid' do
      customer = Customer.new(name: 'ミリオン商事')
      order = Order.new(customer:,
                        ordered_at: Time.zone.now)
      product = Product.new(name: 'バナナ')
      order_item = OrderItem.new(order:,
                                 product:,
                                 amount_in_cases: nil)

      expect(order_item).to be_invalid
    end
  end
end
