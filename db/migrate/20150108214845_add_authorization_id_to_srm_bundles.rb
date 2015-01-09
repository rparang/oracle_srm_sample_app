class AddAuthorizationIdToSrmBundles < ActiveRecord::Migration
  def change
    add_column :srm_bundles, :authorization_id, :integer
  end
end
