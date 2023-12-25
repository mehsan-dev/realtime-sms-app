class SmsJob < ApplicationJob
  queue_as :default

  def perform(user, body)
    SmsService.send_sms(user, user.phone_number, body)
  end
end
