# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CustomersController do
  it '存在する顧客のIDが指定されたとき、顧客が削除され、OKでその顧客の情報が返る' do
    customer = Customer.create!(name: '顧客')

    delete("/customers/#{customer.id}")

    aggregate_failures do
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body, symbolize_names: true))
        .to match(
          id: customer.id,
          name: customer.name,
          created_at: customer.created_at.rfc3339,
          updated_at: customer.updated_at.rfc3339
        )
    end
  end

  it '存在しない顧客のIDが指定されたとき、Not Foundが返る' do
    delete('/customers/1')

    aggregate_failures do
      expect(response).to have_http_status(:not_found)
      expect(JSON.parse(response.body, symbolize_names: true)).to match(
        errors: [
          "No such Customer"
        ]
      )
    end
  end
end
