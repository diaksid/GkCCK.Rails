module HasImages
  extend ActiveSupport::Concern

  included do
    has_many_attached :images
    accepts_nested_attributes_for :images_attachments,
                                  allow_destroy: true

    attr_accessor :images_purge

    validate :images_validation

    private_class_method :images_validation
  end


  def image
    images.order(:index).first if images.attached?
  end


  private


  def images_validation
    images.each do |att|
      if att.byte_size > 1048576
        att.purge
        errors[:base] << I18n.t('errors.messages.file_too_big')
      elsif !att.image?
        att.purge
        errors[:base] << I18n.t('errors.messages.wrong_content_type')
      end
    end
  end

  def images_preprocessing
    images.each do |att|
      filename = att.filename
      image = MiniMagick::Image.read att.download
      # image.resize "0x0"
      att.purge
      att.attach io: File.open(image.tempfile), filename: filename
    end
  end


  module ClassMethods

    def images_validation
      self.all.each {|model| model.images_validation}
    end

  end

end
