# == Schema Information
#
# Table name: stocks
#
#  id         :integer          not null, primary key
#  ticker     :string
#  name       :string
#  last_price :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Stock < ApplicationRecord
end
