class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         #comfirmable

  after_commit :send_welcome_notification, on: :create

  validates :first_name, :last_name, :phone_number, :email, presence: true
  validates :email, uniqueness: true
  has_many :messages
  
  private

  def send_welcome_notification
    SmsService.send_welcome_sms(self)
  end
end
