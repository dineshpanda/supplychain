class AccountHistory < ApplicationRecord
  # Direct associations

  belongs_to :owner,
             :class_name => "Account"

  # Indirect associations

  has_one    :supplier,
             :through => :owner,
             :source => :supplier

  # Validations

  # Scopes

end
