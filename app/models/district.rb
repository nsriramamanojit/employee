class District < ActiveRecord::Base
  #Relations
  belongs_to :state

  #validations
  validates :name, :presence => true, :uniqueness => true, :length => { :maximum => 100}
  validates :state_id, :presence => true

  #search and recent
  class << self
    def recent
      order('created_at DESC').limit(4)
    end
    def search(query)
      if query
        #where(:name.matches => "%#{query}%") #from meta_where gem
        joins(:state).where({:name.matches =>"%#{query}%"}|{:states=>[:name.matches=>"%#{query}%"]})
      else
        scoped
      end
    end
  end

end
