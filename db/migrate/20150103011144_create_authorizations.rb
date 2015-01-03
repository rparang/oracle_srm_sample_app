class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|
      t.integer :srm_app_id
      t.string :access_token
      t.string :refresh_token
      t.string :token_type
      t.string :scope
      t.integer :expires_in
      t.timestamps
    end
  end
end
