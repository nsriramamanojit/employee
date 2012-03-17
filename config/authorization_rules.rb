authorization do

  role :manager do
    has_permission_on [:users,:roles,:states,:districts], :to=>[:index,:show,:export,:profile,:profile_update,:update_profile,:change_password,:password_change]
  end
  role :admin do
    has_permission_on [:users,:roles,:states,:districts], :to=>[:index,:show,:export,:profile,:create,:new,:edit,:update,:update_profile,:profile_update,:change_password,:password_change]

  end

end