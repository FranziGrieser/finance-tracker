# == Schema Information
#
# Table name: user_stocks
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  stock_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_user_stocks_on_stock_id  (stock_id)
#  index_user_stocks_on_user_id   (user_id)
#

describe UserStock, type: :model do
  describe "associations" do
    it { should belong_to :user }
    it { should belong_to :stock }
  end
end
