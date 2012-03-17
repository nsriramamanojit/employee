############# Roles ###############
Role.create(:name => "admin", :short_name => "ad", :description => "Admin", :created_at => Time.now, :created_by => 1)
Role.create(:name => "manager", :short_name => "ma", :description => "Manager", :created_at => Time.now, :created_by => 1)
Role.create(:name => "employee", :short_name => "sc", :description => "Employee", :created_at => Time.now, :created_by => 1)
#################
session = User.create do |u|
  u.name = "Chaitanya Ram N"
  u.email = 'chaitanya@vedavaag.com'
  u.password = 'admin123'
  u.address1= 'Hyderabad'
  u.mobile_number=9666138888
  Assignment.create(:user_id => 1, :role_id => 1, :created_at => Time.now, :updated_at => Time.now)
end
session.save

