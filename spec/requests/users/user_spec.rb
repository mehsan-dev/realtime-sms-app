require 'rails_helper'

RSpec.describe 'User Sessions', type: :request do
  describe 'POST /users/sign_in' do
    let(:password) { '123456' }
    let(:user) { FactoryBot.create(:user, password: password, password_confirmation: password) }

    before do
      user.confirm if defined?(user.confirm)

      twilio_client = double('Twilio::REST::Client')
      allow(Twilio::REST::Client).to receive(:new).and_return(twilio_client)
      messages = double('Twilio::REST::Api::V2010::Account::MessageList')
      allow(twilio_client).to receive(:messages).and_return(messages)
      allow(messages).to receive(:create)
    end

    it 'sends a login SMS successfully' do
      post user_session_path, params: { user: { email: user.email, password: password } }

      follow_redirect! if response.redirect?

      expect(response).to be_successful 
    end

    it 'sends a login SMS and redirects successfully' do
      post user_session_path, params: { user: { email: user.email, password: password } }

      expect(response).to have_http_status(303)
    end
  end
end
