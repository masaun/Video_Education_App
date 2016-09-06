Devise.setup do |config|
  config.mailer_sender = 'Masa @ Video_Education_App <no-reply@Video_Education_App.com>'

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10

  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 8..72
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete

  require 'omniauth-google-oauth2'
  config.omniauth :google_oauth2, '1071552505712-ohkkdnsl9qh5no18sasn6tkp51u5r37e.apps.googleusercontent.com', 'tawBrLFH-XJr_G-am_ORE0Jk', {access_type: "offline", approval_prompt: ""}

  require 'omniauth-facebook'
  config.omniauth :facebook, '1628473897444439', '8c411e9b8092b4d5472eafb5f95731ac'

  require 'omniauth-github'
  config.omniauth :github, 'f36d82e21239b8d9d657', 'f9331f4c340fb2666d32c952a9757a58718d5559', scope: "user:email"

end
