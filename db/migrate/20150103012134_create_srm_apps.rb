class CreateSrmApps < ActiveRecord::Migration
  def change
    create_table :srm_apps do |t|
      t.string :app_id
      t.string :app_secret
      t.string :name
    end
  end
end
