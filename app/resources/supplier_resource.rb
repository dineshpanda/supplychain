class SupplierResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string

  # Direct associations

  has_one    :account

  # Indirect associations

  has_one    :history,
             resource: AccountHistoryResource

end
