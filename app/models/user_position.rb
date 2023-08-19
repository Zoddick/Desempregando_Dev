class UserPosition < ApplicationRecord
  belongs_to :User
  belongs_to :Position
end
