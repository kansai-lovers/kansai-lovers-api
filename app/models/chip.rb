class Chip < ApplicationRecord
  belongs_to :member, foreign_key: 'id'
end
