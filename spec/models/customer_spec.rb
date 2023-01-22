# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customer do
  describe 'name' do
    it 'nameが空だとinvalid' do
      customer = Customer.new(name: '')
      expect(customer).to be_invalid
    end

    it 'nameが入力されているならvalid' do
      customer = Customer.new(name: 'バナナ')
      expect(customer).to be_valid
    end
  end
end
