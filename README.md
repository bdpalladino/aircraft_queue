# Aircraft Queueing System

A simple aircraft queueing subsystem written using:
* Ruby 2.2
* Rails 4.2
* Sqlite3

To run the application:
  1. clone the repository
  2. from a command line/terminal navigate to the project folder
  3. bundle install --path vendor/bundle
  4. bundle exec rake db:migrate

To start using the application, go to localhost:3000 in your browser. Once you're on the home page, select 'Boot System' to begin. This will list any flights previously queued in the system.

Select 'Add New Aircraft to Flight Queue' to enter a new flight. The flight will automatically be added to the flight queue when it is created.

Select 'Remove Flight From Queue' to de-queue a flight. Flights will be de-queued by the system according to the following rules:
* Passenger AC’s have removal precedence over Cargo AC’s.
* arge AC’s of a given type have removal precedence over Small AC’s of the same type.
* Earlier enqueued AC’s of a given type and size have precedence over later enqueued AC’s of the same type and size.