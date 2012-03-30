class HomesController < ApplicationController
  before_filter :require_user
  def index
     @reports = Report.all if has_any_role?(:admin, :manager)
  end
end
