authorization do

  role :manager do
    has_permission_on [:users,:roles,:states,:districts], :to=>[:index,:show,:export,:profile,:profile_update,:update_profile,:change_password,:password_change,:approve,:reset]
    has_permission_on [:reports], :to=>[:index,:show,:date_report]
  end
  role :admin do
    has_permission_on [:users,:roles,:states,:districts], :to=>[:index,:show,:export,:profile,:create,:new,:edit,:update,:update_profile,:profile_update,:change_password,:password_change,:upload,:import,:approve,:reset]
    has_permission_on [:reports], :to=>[:index,:show,:date_report]
  end

  role :employee do
    has_permission_on [:reports], :to=>[:index,:new,:create,:update,:edit,:show]
    has_permission_on [:users], :to=>[:profile,:profile_update,:update_profile,:password_change,:change_password]
  end

end