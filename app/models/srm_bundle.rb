class SrmBundle < ActiveRecord::Base
  belongs_to :authorization

  def self.global
    self.where(name: "Global").first
  end

end