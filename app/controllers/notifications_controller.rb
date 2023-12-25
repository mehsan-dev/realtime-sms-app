class NotificationsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @messages = current_user.messages.order(created_at: :desc)
  end
end
