class Permit < ApplicationRecord
  include WebPage
  include HasImages

  belongs_to :partner
  acts_as_list column: :index,
               top_of_list: 0,
               scope: :partner


  validates_presence_of :name, :number, :provider, :issue_at
  validates_uniqueness_of :number,
                          case_sensitive: false


  default_scope {joins(:partner).merge(Partner.order(:index)).order(:index)}
  scope :active, -> {where('end_at >= ?', Date.today).or(where(end_at: nil))}
  scope :inactive, -> {where('end_at < ?', Date.today).where.not(end_at: nil)}

  paginates_per 10


  def active?
    end_at.nil? || end_at >= Date.today
  end
end
