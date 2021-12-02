class Session < ApplicationRecord
  belongs_to :user

  before_create do
    self.key = SecureRandom.hex(20)
  end
end
