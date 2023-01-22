# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InProcess do
  describe 'start_at' do
    it 'start_atが入力されているならvalid' do
      product = Product.new(name: 'バナナ')
      in_process = InProcess.new(product:,
                                 amount_in_cases: 1,
                                 start_at: Time.zone.now)

      expect(in_process).to be_valid
    end

    it 'start_atが空だとinvalid' do
      product = Product.new(name: 'バナナ')
      in_process = InProcess.new(product:,
                                 amount_in_cases: 1,
                                 start_at: nil)

      expect(in_process).to be_invalid
    end
  end

  describe 'amount_in_cases' do
    it 'amount_in_casesが1以上の整数ならvalid' do
      product = Product.new(name: 'バナナ')
      in_process = InProcess.new(product:,
                                 start_at: Time.zone.now,
                                 amount_in_cases: 1)

      expect(in_process).to be_valid
    end

    it 'amount_in_casesが0だとinvalid' do
      product = Product.new(name: 'バナナ')
      in_process = InProcess.new(product:,
                                 start_at: Time.zone.now,
                                 amount_in_cases: 0)

      expect(in_process).to be_invalid
    end

    it 'amount_in_casesが整数でないとinvalid' do
      product = Product.new(name: 'バナナ')
      in_process = InProcess.new(product:,
                                 start_at: Time.zone.now,
                                 amount_in_cases: 1.5)

      expect(in_process).to be_invalid
    end

    it 'amount_in_casesが空だとinvalid' do
      product = Product.new(name: 'バナナ')
      in_process = InProcess.new(product:,
                                 start_at: Time.zone.now,
                                 amount_in_cases: nil)

      expect(in_process).to be_invalid
    end
  end
end
