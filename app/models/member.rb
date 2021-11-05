class Member < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :repositories, dependent: :destroy
end
