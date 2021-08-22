class ApplicationMailer < ActionMailer::Base
  default from: ENV['DEVISE_MAILER_ADDRESS']
  layout 'mailer'
end
