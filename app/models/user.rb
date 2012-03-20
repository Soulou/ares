class User < ActiveRecord::Base
  devise :database_authenticatable, :rememberable, :trackable, :validatable, :database_authenticatable, :token_authenticatable, authentication_keys: [:username]

  before_create :set_home_directory
  #before_save :add_group_membership, if: :group_changed?

  # primary group
  belongs_to :group

  # groups
  has_many :memberships
  has_many :groups, through: :memberships

  attr_accessible :username, :email, :password, :password_confirmation, :remember_me, :first_name, :description, :last_name, :group_id, :group, :promotion, :start_year

  validates :username, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :group, presence: true
  validates :email, presence: true, uniqueness: true
  validates :promotion, presence: true
  validates :start_year, presence: true

  def name
    "#{first_name} #{last_name}"
  end

  def to_param
    username
  end

  protected
    def set_home_directory
      self.home_directory = "/home/#{username}"
    end

    def add_group_membership
      self.groups << group
    end
end
