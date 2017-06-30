class Shoe < ActiveRecord::Base
  belongs_to :user

  has_many :historys
  has_many :users, through: :historys

  validates :amount, presence: true
end
