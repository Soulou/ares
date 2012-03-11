class Group < ActiveRecord::Base
  has_many :memberships
  has_many :users, through: :memberships, source: :user

  validates :name, presence: true, uniqueness: true

  def to_param
    name
  end
end
