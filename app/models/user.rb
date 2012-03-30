class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.require_password_confirmation= false
    c.validate_password_field= false
  end


  validates :name, :presence => true, :length => {:maximum => 100}
  validates :mobile_number, :presence => true, :length => {:maximum => 10}
  validates :email, :presence => true, :uniqueness => true

  #Relations
  has_many :assignments
  has_many :roles, :through => :assignments
  belongs_to :state
  belongs_to :district

  has_many :reports

  #Roles
  def role_symbols
    roles.map do |role|
      role.name.underscore.to_sym
    end
  end

  #Recent and Search
  class << self
    def recent
      order('id DESC').limit(4)
    end

    def search(query)
      if query
        where({:name.matches => "%#{query}%"} | {:mobile_number.matches => "%#{query}%"} | {:email.matches => "%#{query}%"}) #from meta_where gem
      else
        scoped
      end
    end
    def employee_users
      joins([:roles]).where(:roles => {:name => %w(employee)})
    end
  end

end
