require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#send_welcome_notification' do
    let(:user) { create(:user) }

    context 'when user is created' do
      it 'enqueues a welcome SMS job' do
        ActiveJob::Base.queue_adapter = :test
        expect {
          user.run_callbacks(:commit)
        }.to have_enqueued_job(SmsJob).with(user, "Welcome #{user.first_name} to our app!")
      end
    end

    context 'when Twilio raises an error' do
      before do
        allow_any_instance_of(Twilio::REST::Client).to receive_message_chain(:messages, :create).and_raise(Twilio::REST::TwilioError.new("Error"))
      end

      it 'handles Twilio error gracefully' do
        expect { user.run_callbacks(:commit) }.not_to raise_error
      end
    end
  end
end

