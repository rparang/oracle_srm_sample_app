class SrmApp < ActiveRecord::Base
  has_one :authorization

  def self.global
    self.first
  end

end