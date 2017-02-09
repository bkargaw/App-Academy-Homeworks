# == Schema Information
#
# Table name: buses
#
#  id         :integer          not null, primary key
#  model      :string
#  route_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Bus < ActiveRecord::Base
  belongs_to(
    :route,
    class_name: "Route",
    foreign_key: :route_id,
    primary_key: :id,
  )

  has_many(
    :drivers,
    class_name: "Driver",
    foreign_key: :bus_id,
    primary_key: :id,
  )
end
