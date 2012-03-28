authorization do

  role :manager do
    has_permission_on [:users,:roles,:states,:districts], :to=>[:index,:show,:export,:profile,:profile_update,:update_profile,:change_password,:password_change]
    has_permission_on [:reports], :to=>[:index,:show,:date_report]
  end
  role :admin do
    has_permission_on [:users,:roles,:states,:districts], :to=>[:index,:show,:export,:profile,:create,:new,:edit,:update,:update_profile,:profile_update,:change_password,:password_change,:upload,:import]
    has_permission_on [:reports], :to=>[:index,:show,:date_report]
  end

  role :employee do
    has_permission_on [:reports], :to=>[:index,:new,:create,:update,:edit,:show]
  end

end