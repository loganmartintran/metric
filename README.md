# Metric

## Metric is an analytic service that offers a client-side JavaScript snippet that allows users to track events, a server side API that captures and saves those events to a database, and a Rails application that displays the captured event data to the user.

This app is deployed on Heroku: https://booted-resource.herokuapp.com/

The source code is available, here, on github: https://github.com/loganmartintran/metric

## Setup and Configuration
**Ruby v. 2.3.3**
**Rails v. 4.2.8**
**Databases:** SQLite (Test, Development), PostgreSQL (Production)

**To run Booted locally:**
- Clone the repository
- Run bundle install
- Create and migrate the SQLite database with rake db:create and rake db:migrate
- Start the server using rails s
- Run the app on localhost:3000
