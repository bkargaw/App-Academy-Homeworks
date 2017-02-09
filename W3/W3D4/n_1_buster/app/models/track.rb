# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  title      :string
#  album_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Track < ActiveRecord::Base
  belongs_to(
    :album,
    class_name: "Album",
    foreign_key: :album_id,
    primary_key: :id
  )
end
