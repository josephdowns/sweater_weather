class User < ApplicationRecord
  before_validation :create_api_key

  validates :email, presence: true, uniqueness: true
  validates_presence_of :password_digest
  validates :api_key, presence: true, uniqueness: true
  has_secure_password

  def create_api_key
    self.api_key = SecureRandom.hex(10)
  end
end
