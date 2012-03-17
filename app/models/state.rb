class State < ActiveRecord::Base
  #Relations
  has_many :districts

  #validations
  validates :name, :presence => true, :uniqueness => true, :length => {:maximum => 100}

  #search and recent
  class << self
    def recent
      order('created_at DESC').limit(4)
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
