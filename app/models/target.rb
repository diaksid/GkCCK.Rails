class Target < ApplicationRecord
  include WebPage
  include HasAreas
  include HasImages

  belongs_to :partner, optional: true
  acts_as_list column: :index,
               top_of_list: 0,
               scope: :partner


  IMPORTANTS = {
    'Типовой': 0,
    'Важный': 1,
    'Важнейший': 2
  }

  validates_presence_of :name
  validates_uniqueness_of :name,
                          case_sensitive: false


  default_scope {order(importance: :desc, start_at: :desc, name: :asc)}
  scope :partners, -> {left_joins(:partner).merge(Partner.order(:index)).order(:index)}
  scope :individual, -> {where(partner: nil)}
  scope :active, -> {where('finish_at >= ?', Date.today).or(where(finish_at: nil))}
  scope :inactive, -> {where('finish_at < ?', Date.today).where.not(finish_at: nil)}
  scope :recent, -> (num) {order(start_at: :desc, name: :asc).limit(num)}

  paginates_per 10
end
