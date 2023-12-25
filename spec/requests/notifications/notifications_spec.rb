require 'rails_helper'

RSpec.describe "Notifications", type: :request do
  let(:user) { create(:user, phone_number: '+123456789') }

  describe "GET /notifications" do
    context 'when user is signed in' do
      before do
        sign_in user
      end

      it "responds successfully" do
        get notifications_path
        expect(response).to be_successful
      end
    end

    context 'when user is not signed in' do
      it "redirects to the sign-in page" do
        get notifications_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
