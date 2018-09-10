class ContactForm
  include ActiveModel::Model
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :name, :email, :phone, :subject, :content

  validates_presence_of :name, :email, :content
  validates_length_of :name,
                      in: 3..128
  validates_format_of :email,
                      with: /[a-z0-9][a-z0-9\-_.]+@([a-z]|[a-z0-9]?[a-z0-9\-]+[a-z0-9])\.[a-z0-9]{2,10}(?:\.[a-z]{2,10})?/i
end
