class FlightQueuesController < ApplicationController
  before_action :set_flight_queue, only: [:show, :edit, :update, :destroy]

  def index
    @flight_queues = FlightQueue.all
  end

  def dequeue_flight
    aqm_request_process(DEQUEUE_REQUEST, nil)
  end
end
