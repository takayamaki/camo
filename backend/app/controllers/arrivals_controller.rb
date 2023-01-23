# frozen_string_literal: true

class ArrivalsController < ApplicationController
  def index
    arrivals = Arrival.all

    render json: ArrivalViewModel.from_arrivals(arrivals)
  end

  def show
    arrival = Arrival.find(params[:id])

    render json: ArrivalViewModel.from_arrival(arrival)
  end
end
