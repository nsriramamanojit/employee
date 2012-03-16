class User < ActiveRecord::Base
  acts_as_authentic

  validates :name, :presence => true, :length => {:maximum => 100}
  validates :mobile_number, :presence => true, :length => {:maximum => 10}
  validates :email,:presence => true,:uniqueness => true
  #Recent and Search
  class << self
    def recent
      order('id DESC').limit(4)
    end
    def search(query)
      if query
        where(:name.matches => "%#{query}%") #from meta_where gem
      else
        scoped
      end
    end
  end

end
