class ContactMailer < ApplicationMailer
  def contact_form(model)
    @model = model
    mail(from: %("#{model.email}" <#{ENV['MAILER_USER_NAME'] ? ENV['MAILER_USER_NAME'] : 'no-reply@%s' % ENV['MAILER_DOMAIN']}>),
         reply_to: %("#{model.name}" <#{model.email}>),
         subject: %(#{model.subject.empty? ? 'контактная форма' : model.subject}))
  end
end
