class ApplicationMailer < ActionMailer::Base
  default template_path: 'mailers'
  layout 'mailer'
end
