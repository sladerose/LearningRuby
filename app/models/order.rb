class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy
  validates :email_address, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  before_validation :set_default_status, on: :create

  private
    def set_default_status
      self.status ||= "pending"
    end
end
