class Supplier < ApplicationRecord
  # Direct associations

  has_one    :account,
             :dependent => :destroy

  # Indirect associations

  has_one    :history,
             :through => :account,
             :source => :account_history

  # Validations

  # Scopes

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
