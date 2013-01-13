# == Schema Information
#
# Table name: accounts
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  address      :text
#  phone        :string(255)
#  logo         :string(255)
#  plan         :string(255)
#  primary_user :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Account < ActiveRecord::Base
  attr_accessible :name, :address, :phone, :logo
  
  has_many :users
  has_one :primary_user, :class_name => "user",
                         :conditions => {:is_primary => true}
end
