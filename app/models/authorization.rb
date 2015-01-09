class Authorization < ActiveRecord::Base
  belongs_to :srm_app
  has_many :srm_bundles

  def sync_bundles
    # first, get the account_id for this authorization by looking up
    # all accounts (a.k.a top-level bundles) and taking the first one (in most cases, there is only one account)
    if self.account_id.blank?
      accounts_response = SrmClient.fetch_accounts(self)
      accounts_list = JSON.parse(accounts_response.body)["items"]
      account = accounts_list.first
      self.update_attribute(:account_id, account["bundle_id"])
    end

    bundles_response = SrmClient.fetch_bundles(self)
    bundles_list = JSON.parse(bundles_response.body)["items"]

    bundles_list.each do |bundle_attrs|
      bundle = SrmBundle.find_or_initialize_by(
        :authorization_id => self.id, 
        :bundle_id => bundle_attrs["bundle_id"]
      )
      bundle.name = bundle_attrs["name"]
      bundle.save!
    end
  end
end