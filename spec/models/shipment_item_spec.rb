# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShipmentItem do
  describe 'amount_in_cases' do
    it 'amount_in_casesが1以上の整数ならvalid' do
      customer = Customer.new(name: 'ミリオン商事')
      shipment = Shipment.new(customer:,
                              shipped_at: Time.zone.now)
      product = Product.new(name: 'バナナ')
      in_process = InProcess.new(product:, start_at: 1.day.ago)
      shipment_item = ShipmentItem.new(shipment:,
                                       in_process:,
                                       amount_in_cases: 1)

      expect(shipment_item).to be_valid
    end

    it 'amount_in_casesが0だとinvalid' do
      customer = Customer.new(name: 'ミリオン商事')
      shipment = Shipment.new(customer:,
                              shipped_at: Time.zone.now)
      product = Product.new(name: 'バナナ')
      in_process = InProcess.new(product:, start_at: 1.day.ago)
      shipment_item = ShipmentItem.new(shipment:,
                                       in_process:,
                                       amount_in_cases: 0)

      expect(shipment_item).to be_invalid
    end

    it 'amount_in_casesが整数でないとinvalid' do
      customer = Customer.new(name: 'ミリオン商事')
      shipment = Shipment.new(customer:,
                              shipped_at: Time.zone.now)
      product = Product.new(name: 'バナナ')
      in_process = InProcess.new(product:, start_at: 1.day.ago)
      shipment_item = ShipmentItem.new(shipment:,
                                       in_process:,
                                       amount_in_cases: 1.5)

      expect(shipment_item).to be_invalid
    end

    it 'amount_in_casesが空だとinvalid' do
      customer = Customer.new(name: 'ミリオン商事')
      shipment = Shipment.new(customer:,
                              shipped_at: Time.zone.now)
      product = Product.new(name: 'バナナ')
      in_process = InProcess.new(product:, start_at: 1.day.ago)
      shipment_item = ShipmentItem.new(shipment:,
                                       in_process:,
                                       amount_in_cases: nil)

      expect(shipment_item).to be_invalid
    end
  end
end
