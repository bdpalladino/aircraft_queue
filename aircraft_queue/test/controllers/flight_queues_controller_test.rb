require 'test_helper'

class FlightQueuesControllerTest < ActionController::TestCase
  setup do
    @flight_queue = flight_queues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:flight_queues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create flight_queue" do
    assert_difference('FlightQueue.count') do
      post :create, flight_queue: { aircraft_id: @flight_queue.aircraft_id, enqueued: @flight_queue.enqueued }
    end

    assert_redirected_to flight_queue_path(assigns(:flight_queue))
  end

  test "should show flight_queue" do
    get :show, id: @flight_queue
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @flight_queue
    assert_response :success
  end

  test "should update flight_queue" do
    patch :update, id: @flight_queue, flight_queue: { aircraft_id: @flight_queue.aircraft_id, enqueued: @flight_queue.enqueued }
    assert_redirected_to flight_queue_path(assigns(:flight_queue))
  end

  test "should destroy flight_queue" do
    assert_difference('FlightQueue.count', -1) do
      delete :destroy, id: @flight_queue
    end

    assert_redirected_to flight_queues_path
  end
end
