# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_stocks
  has_many :stocks, through: :user_stocks

  has_many :friendships
  has_many :friends, through: :friendships

  def can_add_stock?(ticker_symbol)
    under_stock_limit? && !stock_already_added(ticker_symbol)
  end

  def full_name
    return "#{first_name} #{last_name}".strip if first_name || last_name

    "anonymous"
  end

  def self.search(param)
    param.strip!
    param.downcase!

    to_send_back =
      (
        first_name_matches(param) +
        last_name_matches(param) +
        email_matches(param)
      ).uniq
    return nil unless to_send_back

    to_send_back
  end

  def self.first_name_matches(param)
    matches("first_name", param)
  end

  def self.last_name_matches(param)
    matches("last_name", param)
  end

  def self.email_matches(param)
    matches("email", param)
  end

  def matches(field_name, param)
    User.where("#{field_name} like ?", "%#{param}%")
  end

  def stock_already_added(ticker_symbol)
    stock = Stock.find_by_ticker(ticker_symbol)
    return false unless stock

    user_stocks.where(stock_id: stock.id).exists?
  end

  def under_stock_limit?
    (user_stocks.count < 10)
  end
end
