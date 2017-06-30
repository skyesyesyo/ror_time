class History < ActiveRecord::Base
  belongs_to :user
  belongs_to :shoe

  has_many :users_history, through: :shoes, source: :user
  has_many :shoes_history, through: :users, source: :shoe
end
