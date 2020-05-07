class AccountHistoryResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :owner_id, :integer

  # Direct associations

  # Indirect associations

end
