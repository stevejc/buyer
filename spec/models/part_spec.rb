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

require 'spec_helper'

describe Part do
  pending "add some examples to (or delete) #{__FILE__}"
end
