class ReportsController < ApplicationController
  before_filter :require_user
  layout "application", :except => [:show]
  filter_access_to :all

  def index
    @reports = Report.paginate(:page => page, :per_page => per_page) if has_any_role?(:admin, :manager)
    @reports = Report.where(:user_id => current_user.id).paginate(:page => page, :per_page => per_page).order("date DESC") if has_role?(:employee)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @reports }
    end
  end

  def show
    @report = Report.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @report }
    end
  end

  def new
    @report = Report.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @report }
    end
  end

  def edit
    @report = Report.find(params[:id])
  end

  def create
    @report = Report.new(params[:report])

    @check_report_data = Report.where(:user_id => params[:report][:user_id], :date=>params[:report][:date].to_date)

    if @check_report_data.blank?
      respond_to do |format|
        if @report.save
          format.html { redirect_to(reports_path, :notice => 'EOD Report was successfully Submitted.') }
          format.xml  { render :xml => @report, :status => :created, :location => @report }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @report.errors, :status => :unprocessable_entity }
        end
      end

    else
      flash[:error] = "EOD Report Already Submitted for the Date. You can modify your report."
      redirect_to reports_path
     end


  end

  def update
    @report = Report.find(params[:id])

    respond_to do |format|
      if @report.update_attributes(params[:report])
        format.html { redirect_to(reports_url, :notice => 'EOD Report was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @report.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy

    respond_to do |format|
      format.html { redirect_to(reports_url) }
      format.xml  { head :ok }
    end
  end
  def date_report
    @reports = Report.where(:date => params[:id].to_date).paginate(:page => page, :per_page => per_page)
  end
end
