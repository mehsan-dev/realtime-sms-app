# SMS Notification Application

This application sends sms notification using twilio at user registration level and everytime the user login to the app.


## Installation

Clone the repository to your local machine:

```bash
git clone https://github.com/DevKnight7/Real-Time-SMS-Notification-System.git
cd Real-Time-SMS-Notification-System
```
## Database
- `PostgreSQL Database`

## Getting Started

First, install all the required dependencies:

```bash
bundle install
rails db:create
rails db:migrate
```

Create a `.env` file in the project root and define your environment variables:

```bash
TWILIO_ACCOUNT_SID=your_sid
TWILIO_AUTH_TOKEN=your_auth_token
TWILIO_NUMBER=your_number
GMAIL_USERNAME=your_username
GMAIL_PASSWORD=your_password
MAILER_HOST=your_host
SMTP_ADDRESS=your_smtp_address
SMTP_DOMAIN=your_smtp_domain
POSTGRES_USER=your_postgres_username
POSTGRES_PASSWORD=your_postgres_password
SMS_NOTIFICATION_APP_DATABASE_PASSWORD=your_database_password
```
## Local 
Run the application: `rails server` or `rails s`.

Open `http://localhost:3000` to view it in the browser

## Docker
- First make the entrypoint.sh file executable by running `chmod +x entrypoint.sh`
- `docker-compose build --no-cache` to build the docker container
- `docker-compose up` to start the docker container

## Structure
- config/initializers/twilio.rb                    : Contains Twilio configuration
- app/controllers/user/notifications_controller.rb : Shows list of messages for the current user
- app/jobs/sms_job.rb                              : Handles sending mesasges in the background
- app/services/sms_service.rb                      : Contains send, fetching and storing messages from twilio
- app/models/user.rb                               : Contains user model validations and send notification when user is registered
- app/views/devise                                 : Contains devise views
- app/views/home                                   : Contains home screen view
- app/views/layouts                                : Contains common layout
- db/schema.rb                                     : Contains user schema
- db/migrate                                       : Contains migrations
- spec/factories/user.rb                           : Contains user factory
- spec/model/user_spec.rb                           : User model specs
- Dockerfile                                       : Contains Dockerfile

## Gems 
- `devise`      : For User registration and login
- `twilio-ruby` : For Twilio configuration in rails project
- `rspec`       : For rails application test cases
