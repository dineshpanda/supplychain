class CreateAccountHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :account_histories do |t|
      t.integer :owner_id

      t.timestamps
    end
  end
end
