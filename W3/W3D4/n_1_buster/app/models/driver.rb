# == Schema Information
#
# Table name: drivers
#
#  id         :integer          not null, primary key
#  name       :string
#  bus_id     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Driver < ActiveRecord::Base
  belongs_to(
    :bus,
    class_name: "Bus",
    foreign_key: :bus_id,
    primary_key: :id
  )
end
