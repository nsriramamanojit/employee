class Report < ActiveRecord::Base
  #relations
  belongs_to :user

  #validations
  validates :report, :presence => true
  validates :date, :presence => true

end
