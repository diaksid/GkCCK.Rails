module HasImage
  extend ActiveSupport::Concern

  included do
    has_one_attached :image

    attr_accessor :image_purge

    after_save :image_check

    private_class_method :image_check
  end


  # def image_url(*size)
  #   image.attached? ? url_for(image.variant resize_to fit **size) : image_url('system/image.svg')
  # end


  private


  def image_check
    if image.attached?
      if image.byte_size > 1048576
        image.purge
        errors[:base] << I18n.t('errors.messages.file_too_big')
      elsif !image.image?
        image.purge
        errors[:base] << I18n.t('errors.messages.wrong_content_type')
      end
    end
  end


  def image_preprocessing
    if image.attached?
      filename = image.filename
      att = MiniMagick::Image.read image.download
      # att.resize "0x0"
      image.purge
      image.attach io: File.open(att.tempfile), filename: filename
    end
  end

  module ClassMethods

    def image_check
      self.all.each { |model| model.image_validation }
    end

  end

end
