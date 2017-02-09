# == Schema Information
#
# Table name: plants
#
#  id          :integer          not null, primary key
#  gardener_id :integer
#  species     :string
#

class Plant < ActiveRecord::Base
  belongs_to(
  :gardener,
  class_name: "Gardener",
  foreign_key: :gardener_id,
  primary_key: :id
)

has_many(
  :seeds,
  class_name: "Seed",
  foreign_key: :plant_id,
  primary_key: :id
)
end
