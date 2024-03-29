module ApplicationHelper
  def per_page
    select_tag :per_page, options_for_select([5, 10, 20, 50, 100], @per_page.to_i), :onchange => "if(this.value){window.location='?per_page='+this.value+'&page=#{@page}'+'&query=#{@query}'}"
  end

  def link_for_edit(path)
    link_to image_tag('/images/icons/edit.png'), path, :title => 'Update', :class => 'tipTip', :border => 0
  end

  def link_for_show(path)
    link_to image_tag('/images/icons/show.png'), path, :title => 'View', :class => 'tipTipTop', :border => 0
  end
  def link_for_reset(path)
    link_to image_tag('/images/icons/passwordreset.png'), path, :title => 'Reset', :class => 'tipTipTop', :border => 0
  end

  def link_for_show_pop(path)
    link_to image_tag('/images/icons/show.png'), path, :title => 'View', :class => 'tipTipTop', :rel => "facebox", :border => 0
  end

  def link_for_destroy(path)
    link_to image_tag('/images/icons/delete.png'), path, :confirm => 'Are you sure?', :method => :delete, :title => 'Delete', :class => 'tipTip'
  end

  def tab_heading(heading)
    content = ""
    content << "<a href='#'>"
    content << "<div class='menu-l'>&nbsp;</div><div class='menu-c'><span>&nbsp;&nbsp;#{heading}&nbsp;&nbsp;&nbsp;</span></div>"
    content << "<div class='menu-r'>&nbsp;</div></a>"
    content.html_safe
  end

  def sub_heading(main, sub)
    "<h3>#{main}<span>&nbsp;|&nbsp;#{sub}</span></h3>".html_safe
  end
  def title(page_title, show_title = true)
    content_for(:title) { h(page_title.to_s) }
    @show_title = show_title
  end

  def show_title?
    @show_title
  end

  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end

  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end
  def link_to_all(path)
    link_to content_tag(:span, "Back To List &rarr;".html_safe), path, :class => 'btn-yellow'
  end
  def users_list(users)
    return 'No Users found' if users.blank?
    content = ''
    j = 1
    for user in users[0..15]
      content << "#{j}. " + user.name + "<br/>"
      j += 1
    end
    content << 'and more' if users.size > 16
    content.html_safe
  end
  def associated_names(records)
    return 'No Records found' if records.blank?
    content = ''
    i = 1
    for record in records
      content << "#{i}. " + record.name + "<br/>"
      i += 1
    end
    content.html_safe
  end
  def get_role(user)
    roles = Role.where(:id=>user.roles)
    content = ""
    for role in roles
      content << role.name.titleize
      content <<  "<br/>"
    end
    content.html_safe
  end
  def get_list_users(records)
    return 'No Users found' if records.blank?
    content = ""
     i = 1
     for record in records[0..15]
      content << "#{i}. " + record.user.name + "<br/>"
       i +=1
     end
     content << 'and more' if records.size > 16
     content.html_safe
  end
  def link_to_active(model, path)
    content = ''
    content << "<div id='status_#{model.id}'>"
    content << link_to(model.status ? image_tag('tick.gif') : image_tag('cros.gif'), path, :remote=>true)
    content << "</div>"
    content.html_safe
  end
  def get_list_members(records)
    content = ""
    submitted_users = Array.new
    i = 1
    for record in records
      #content << "#{i}. " + record.user.name + "<br/>"
      submitted_users << record.user.id
      i +=1
    end
    #content << "<br />"
    users = User.employee_users.where(["users.id NOT IN (?)", submitted_users])
    j = 1
    for user in users
      content << "#{j}. " + user.name + "<br/>"
      j +=1
    end
    content.html_safe
  end


end
