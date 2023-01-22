# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order do
  describe 'ordered_at' do
    it 'ordered_atが入力されているならvalid' do
      customer = Customer.new(name: 'ミリオン商事')
      order = Order.new(customer:,
                        ordered_at: Time.zone.now)

      expect(order).to be_valid
    end

    it 'ordered_atが空だとinvalid' do
      customer = Customer.new(name: 'ミリオン商事')
      order = Order.new(customer:,
                        ordered_at: nil)

      expect(order).to be_invalid
    end
  end
end
