class CreateSrmBundles < ActiveRecord::Migration
  def change
    create_table :srm_bundles do |t|
      t.string :bundle_id
      t.string :name
    end
  end
end
