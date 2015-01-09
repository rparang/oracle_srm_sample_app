class AddAccountIdToAuthorizations < ActiveRecord::Migration
  def change
    add_column :authorizations, :account_id, :string
  end
end
