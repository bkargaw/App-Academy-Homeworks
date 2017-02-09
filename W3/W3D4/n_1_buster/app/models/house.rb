# == Schema Information
#
# Table name: houses
#
#  id      :integer          not null, primary key
#  address :string
#

class House < ActiveRecord::Base
  has_many(
    :gardeners,
    class_name: "Gardener",
    foreign_key: :house_id,
    primary_key: :id
  )

  has_many(
    :plants,
    through: :gardeners,
    source: :plants
  )

  has_many(
    :seeds,
    through: :plants,
    source: :seeds
  )

  def n_plus_one_seeds
    plants = self.plants
    seeds = []
    plants.each do |plant|
      seeds << plant.seeds
    end

    seeds
  end

  def better_seeds_query
    plants = self.plants.includes(:seeds)
    seeds = []
    plants.each do |plant|
      seeds << plant.seeds
    end

    seeds
  end
end
