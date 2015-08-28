class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # handle queueing requests
  def aqm_request_process(request_type, aircraft)
  	case request_type
  	  when BOOT_REQUEST
  		start_process
  	  when ENQUEUE_REQUEST
  		enqueue_process(aircraft)
  	  when DEQUEUE_REQUEST
  		dequeue_process
  	end
  end

  def start_process
  	# 'boot' the system - start services etc, in this case we're 'faking it' by  
  	# redirecting to flight queue list, simulating starting a larger process
  	redirect_to flight_queues_path
  end

  def enqueue_process(aircraft)  	
    # create flight_queue & add to aircraft    
  	aircraft.flight_queue = FlightQueue.create(enqueued: DateTime.now, aircraft: aircraft)
  	# save aircraft to db
  	aircraft.save
    # redirect to flight queue list
    redirect_to flight_queues_path
  end

  def dequeue_process
  	# remove aircraft from queue 
    flight = Aircraft.includes(:flight_queue).
             order(flight_type: :desc, flight_size: :asc).
             references(:flight_queue).
             order("flight_queues.enqueued asc").
             first
    
    if flight != nil 
       queue = flight.flight_queue
       queue.destroy
       flight.destroy       
    end
    
	redirect_to flight_queues_path
  end

end
