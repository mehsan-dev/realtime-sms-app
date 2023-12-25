class SmsService

  def self.send_welcome_sms(user)
    SmsJob.perform_later(user, "Welcome #{user.first_name} to our app!")
  end

  def self.send_login_sms(user)
    SmsJob.perform_later(user, "Hello #{user.first_name}, you have successfully logged in.")
  end
  
  def self.fetch_messages_for_user(user)
    client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
    client.messages.list(to: user.phone_number)
  end

  private

  def self.send_sms(user, to, body)
    client = Twilio::REST::Client.new
    message = client.messages.create(
      from: ENV['TWILIO_NUMBER'],
      to: to,
      body: body
    )

    user.messages.create!(
      to: to,
      body: body,
      status: message.status
    )
  rescue Twilio::REST::TwilioError => e
    user.messages.create!(
      to: to,
      body: body,
      status: 'failed',
      error_message: e.message
    )
    Rails.logger.error "Twilio error: #{e.message}"
  end
end
