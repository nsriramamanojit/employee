authorization do

  role :manager do
    has_permission_on [:users,:roles,:states,:districts], :to=>[:index,:show,:export,:profile]
  end
  role :admin do
    has_permission_on [:users,:roles,:states,:districts], :to=>[:index,:show,:export,:profile,:create,:new,:edit,:update]
  end

end