# frozen_string_literal: true

class ArrivalsController < ApplicationController
  def index
    arrivals = Arrival.all

    render json: ArrivalViewModel.from_arrivals(arrivals)
  end
end
