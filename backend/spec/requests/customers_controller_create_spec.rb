# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CustomersController do
  it 'validなパラメータが指定されたとき、OKで顧客が作成され、その顧客の情報が返る' do
    params = {
      name: '顧客名',
    }
    post('/customers', params:)
    customer = Customer.last

    aggregate_failures do
      expect(response).to have_http_status(:ok)
      expect(customer.name).to eq(params[:name])
      expect(JSON.parse(response.body, symbolize_names: true))
        .to match(
          id: customer.id,
          name: customer.name,
          created_at: customer.created_at.rfc3339,
          updated_at: customer.updated_at.rfc3339
        )
    end
  end

  it 'invalidなパラメータが指定されたとき、422 Unprocessible Entityでエラー内容が返る' do
    params = {
      name: '',
    }
    post('/customers', params:)

    aggregate_failures do
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body, symbolize_names: true))
        .to match(
          errors: match_array("Name can't be blank")
        )
    end
  end
end
