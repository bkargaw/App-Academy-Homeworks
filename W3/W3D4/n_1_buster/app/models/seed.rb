# == Schema Information
#
# Table name: seeds
#
#  id       :integer          not null, primary key
#  count    :integer
#  plant_id :integer
#

class Seed < ActiveRecord::Base
  belongs_to(
    :plant,
    class_name: "Plant",
    foreign_key: :plant_id,
    primary_key: :id
  )
end
