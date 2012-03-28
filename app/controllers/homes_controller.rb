class HomesController < ApplicationController
  def index
     @reports = Report.all if has_any_role?(:admin, :manager)
  end
end
