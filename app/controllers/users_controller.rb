class UsersController < ApplicationController
  layout "application", :except => [:show, :edit]
  before_filter :require_user, :recent_items
  filter_access_to :all

  def index
    @users = User.search(params[:search]).paginate(:page => page, :per_page => per_page) if has_any_role?(:admin, :manager)

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @users }
    end
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @user }
    end
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @user }
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    @user.password=params[:user][:email]


    respond_to do |format|
      if @user.save
        #send Mail
        UserMailer.welcome_email(@user).deliver

        format.html { redirect_to(users_url, :notice => 'User was successfully created.') }
        format.xml { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml { head :ok }
    end
  end

  def profile
    @user = User.find(params[:id])
  end

  def update_profile
    @user = User.find(params[:id])
  end

  def profile_update
    @user = current_user
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(profile_user_path(current_user), :notice => 'Profile Updated Successfully.') }
        format.xml { head :ok }
      else
        format.html { render :action => "profile_update" }
        format.xml { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def change_password
    @user = current_user

  end

  def password_change
    @user = current_user
    return flash.now[:error] = "Current password is Wrong/Blank" unless @user.valid_password? params[:old_password]
    if params[:password] == params[:password_confirmation] && !params[:password_confirmation].blank?
      @user.password = params[:password]
      if @user.save
        flash.now[:notice] = "Password Changed Successfully."
        #redirect_to profile_user_path(current_user)
      else
        flash.now[:error]= "Password not changed"
      end
    else
      flash.now[:error] = "New Password mismatch"
      @old_password = params[:old_password]
    end
  end

  def upload
    render
  end

  def import
    require 'csv'
    csv_file = params[:file]
    n=0
    CSV.new(csv_file.tempfile, :col_sep => ",").each do |row|
      user = User.create do |u|
        u.name =row[0]
        u.email = row[1]
        u.password = row[1]
        u.mobile_number = row[2]
        district=District.find_by_name(row[3].strip)
        u.district_id =district.id
        u.state_id = 1
      end
      if user.save
        Assignment.create(:user_id => user.id, :role_id => 3, :created_at => Time.now, :updated_at => Time.now)
      end
      n = n + 1
    end
    flash[:notice]= "#{n} Users are imported successfully"
    respond_to do |format|
      format.html { redirect_to(users_path) }
      format.xml { head :ok }
    end
  end

  ###################################################
  private
  def recent_items
    @recent = User.recent
  end

end
