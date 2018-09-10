class Feedback < ApplicationRecord
  include WebPage
  include HasImage

  belongs_to :partner, optional: true
  acts_as_list column: :index,
               top_of_list: 0,
               scope: :partner


  validates_presence_of :header

  before_save :check_attributes


  default_scope {order(published_at: :desc, header: :asc)}
  scope :source, -> {left_joins(:partner).merge(Partner.order(:index)).order(:index)}
  scope :recent, -> (num) {order(published_at: :desc, header: :asc).limit(num)}

  paginates_per 10


  def to_s
    "#{I18n.t 'activerecord.models.feedback.one'} ##{id}"
  end


  def name
    to_s
  end

  private

  def check_attributes
    if published
      self.published_at = DateTime.now if published_at.blank?
    else
      self.published_at = nil
    end
  end
end
