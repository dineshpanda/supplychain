class AccountResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :supplier_id, :integer
  attribute :acc_type, :string

  # Direct associations

  has_one    :account_history,
             foreign_key: :owner_id

  belongs_to :supplier

  # Indirect associations

end
