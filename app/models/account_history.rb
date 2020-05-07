class AccountHistory < ApplicationRecord
  # Direct associations

  belongs_to :owner,
             :class_name => "Account"

  # Indirect associations

  # Validations

  # Scopes

end
