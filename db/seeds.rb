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
session = User.create do |u|
  u.name = "Ch Vish"
  u.email = 'chittav@rediffmail.com'
  u.password = 'admin123'
  u.address1= 'Hyderabad'
  u.mobile_number=9666138888
  Assignment.create(:user_id => 2, :role_id => 2, :created_at => Time.now, :updated_at => Time.now)
end
session.save
##############States###############
State.create(:name=>'Bihar',:description=>'Bihar',:created_by=>1,:created_at=>Time.now)
#============Districts==================#
District.create(:name=>'Banka',:state_id=>1,:created_by=>1,:created_at=>Time.now)
District.create(:name=>'Bhagalpur',:state_id=>1,:created_by=>1,:created_at=>Time.now)
District.create(:name=>'Begusarai',:state_id=>1,:created_by=>1,:created_at=>Time.now)
District.create(:name=>'Darbhanga',:state_id=>1,:created_by=>1,:created_at=>Time.now)
District.create(:name=>'Madhubani',:state_id=>1,:created_by=>1,:created_at=>Time.now)
District.create(:name=>'Samastipur',:state_id=>1,:created_by=>1,:created_at=>Time.now)
District.create(:name=>'Madhepura',:state_id=>1,:created_by=>1,:created_at=>Time.now)
District.create(:name=>'Saharsa',:state_id=>1,:created_by=>1,:created_at=>Time.now)
District.create(:name=>'Supaul',:state_id=>1,:created_by=>1,:created_at=>Time.now)
District.create(:name=>'Arwal',:state_id=>1,:created_by=>1,:created_at=>Time.now)
District.create(:name=>'Aurangabad',:state_id=>1,:created_by=>1,:created_at=>Time.now)
District.create(:name=>'Gaya',:state_id=>1,:created_by=>1,:created_at=>Time.now)
District.create(:name=>'Jehanabad',:state_id=>1,:created_by=>1,:created_at=>Time.now)
District.create(:name=>'Nawada',:state_id=>1,:created_by=>1,:created_at=>Time.now)
District.create(:name=>'Jamui',:state_id=>1,:created_by=>1,:created_at=>Time.now)
District.create(:name=>'Khagaria',:state_id=>1,:created_by=>1,:created_at=>Time.now)
District.create(:name=>'Munger',:state_id=>1,:created_by=>1,:created_at=>Time.now)
District.create(:name=>'Lakhisarai',:state_id=>1,:created_by=>1,:created_at=>Time.now)
District.create(:name=>'Sheikhpura',:state_id=>1,:created_by=>1,:created_at=>Time.now)
District.create(:name=>'Bhojpur',:state_id=>1,:created_by=>1,:created_at=>Time.now)
District.create(:name=>'Buxar',:state_id=>1,:created_by=>1,:created_at=>Time.now)
District.create(:name=>'Kaimur',:state_id=>1,:created_by=>1,:created_at=>Time.now)
District.create(:name=>'Patna',:state_id=>1,:created_by=>1,:created_at=>Time.now)
District.create(:name=>'Rohtas',:state_id=>1,:created_by=>1,:created_at=>Time.now)
District.create(:name=>'Nalanda',:state_id=>1,:created_by=>1,:created_at=>Time.now)
District.create(:name=>'Araria',:state_id=>1,:created_by=>1,:created_at=>Time.now)
District.create(:name=>'Katihar',:state_id=>1,:created_by=>1,:created_at=>Time.now)
District.create(:name=>'Kishanganj',:state_id=>1,:created_by=>1,:created_at=>Time.now)
District.create(:name=>'Purnia',:state_id=>1,:created_by=>1,:created_at=>Time.now)
District.create(:name=>'Gopalganj',:state_id=>1,:created_by=>1,:created_at=>Time.now)
District.create(:name=>'Chapra',:state_id=>1,:created_by=>1,:created_at=>Time.now)
District.create(:name=>'Siwan',:state_id=>1,:created_by=>1,:created_at=>Time.now)
District.create(:name=>'East Champaran',:state_id=>1,:created_by=>1,:created_at=>Time.now)
District.create(:name=>'Muzaffarpur',:state_id=>1,:created_by=>1,:created_at=>Time.now)
District.create(:name=>'Sheohar',:state_id=>1,:created_by=>1,:created_at=>Time.now)
District.create(:name=>'Sitamarhi',:state_id=>1,:created_by=>1,:created_at=>Time.now)
District.create(:name=>'Vaishali',:state_id=>1,:created_by=>1,:created_at=>Time.now)
District.create(:name=>'West Champaran',:state_id=>1,:created_by=>1,:created_at=>Time.now)