class Member < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :repositories, dependent: :destroy
  has_many :chips, dependent: :destroy, foreign_key: 'members_id'

  def dev_design
    arr_x = Member.all.pluck(:total_hooray_count)
    avg = arr_x.sum / arr_x.length
    arr1 = arr_x.map { |x| (x - avg)**2 }
    std = Math.sqrt(arr1.sum / arr_x.length)
    # stdが0になって0除算
    ((total_hooray_count - avg) * 10 / std + 50).round(2)
  end

  def dev_implementation
    arr_x = Member.all.pluck(:total_rocket_count)
    avg = arr_x.sum / arr_x.length
    arr1 = arr_x.map { |x| (x - avg)**2 }
    std = Math.sqrt(arr1.sum / arr_x.length)
    # stdが0になって0除算
    ((total_rocket_count - avg) * 10 / std + 50).round(2)
  end

  def dev_communication
    arr_x = Member.all.pluck(:total_heart_count)
    avg = arr_x.sum / arr_x.length
    arr1 = arr_x.map { |x| (x - avg)**2 }
    std = Math.sqrt(arr1.sum / arr_x.length)
    # stdが0になって0除算
    ((total_heart_count - avg) * 10 / std + 50).round(2)
  end
end
