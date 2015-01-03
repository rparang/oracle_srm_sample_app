class SrmBundle < ActiveRecord::Base

  def self.global
    self.where(name: "Global").first
  end

end