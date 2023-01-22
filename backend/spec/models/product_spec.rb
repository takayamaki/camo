# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product do
  it 'nameが空だとinvalid' do
    product = Product.new(name: '')
    expect(product).to be_invalid
  end

  it 'nameが入力されているならvalid' do
    product = Product.new(name: 'バナナ')
    expect(product).to be_valid
  end
end
