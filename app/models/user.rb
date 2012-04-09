class User < ActiveRecord::Base
  has_many :expert_systems, dependent: :destroy
  has_many :diagnosed_objects, through: :expert_systems
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  validates :name, presence: true
	validates :email, :name, uniqueness: { case_sensitive: false }

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
end
