# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Shipment do
  describe 'shipped_at' do
    it 'shipped_atが入力されているならvalid' do
      customer = Customer.new(name: 'ミリオン商事')
      shipment = Shipment.new(customer:,
                              shipped_at: Time.zone.now)

      expect(shipment).to be_valid
    end

    it 'shipped_atが空だとinvalid' do
      customer = Customer.new(name: 'ミリオン商事')
      shipment = Shipment.new(customer:,
                              shipped_at: nil)

      expect(shipment).to be_invalid
    end
  end
end
