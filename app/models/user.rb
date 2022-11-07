class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
  include Uuidable
  include Tokenizable
  include Hashable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable,  and :omniauthable
  devise :database_authenticatable, :trackable,
         :recoverable, :rememberable, :validatable

  has_many :assignment_achieveds, dependent: :destroy

  def full_name
    "#{first_name} #{last_name}"
  end

  def admin?
    self.type == 'Administrator'
  end
end
