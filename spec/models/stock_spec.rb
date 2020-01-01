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

describe Stock, type: :model do
  describe "attributes" do
    it { should have_attribute(:ticker) }
    it { should have_attribute(:name) }
    it { should have_attribute(:last_price) }
  end

  describe "associations" do
    it { should have_many :users }
    it { should have_many :user_stocks }
  end
end
