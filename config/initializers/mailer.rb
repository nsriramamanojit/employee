=begin
ActionMailer::Base.smtp_settings = {
    :address              => "mail.vedavaag.com",
    :port                 => 25,
    :domain               => "vedavaag.com",
    :user_name            => "chaitanya+vedavaag.com",
    :password             => "chaitu1479",
    :authentication       => :login,
    :enable_starttls_auto => false
}
=end
ActionMailer::Base.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => "vedavaag.com",
    :user_name            => "vedavaagtracker",
    :password             => "chaitu1479",
    :authentication       => 'plain',
    :enable_starttls_auto => true
}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default_url_options[:host] = "localhost:3000"