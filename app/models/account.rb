class Account < ApplicationRecord
  # Direct associations

  has_one    :account_history,
             :foreign_key => "owner_id",
             :dependent => :destroy

  belongs_to :supplier

  # Indirect associations

  # Validations

  # Scopes

end
