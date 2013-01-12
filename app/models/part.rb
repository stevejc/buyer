# == Schema Information
#
# Table name: parts
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  number      :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Part < ActiveRecord::Base
  attr_accessible :description, :name, :number
  
  validates :name, :presence => true
end
