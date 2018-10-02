class Partner < ApplicationRecord
  include WebPage
  include HasImage

  has_many :targets, -> {order(:index)}
  accepts_nested_attributes_for :targets,
                                allow_destroy: false
  has_many :permits, -> {order(:index)}
  accepts_nested_attributes_for :permits,
                                allow_destroy: true
  has_many :feedbacks, -> {order(:index)}
  accepts_nested_attributes_for :feedbacks,
                                allow_destroy: true

  belongs_to :user,
             optional: true

  acts_as_list column: :index,
               top_of_list: 0


  validates_presence_of :name
  validates_uniqueness_of :name,
                          case_sensitive: false


  default_scope {order(:index)}
  scope :active, -> {where(active: true)}
  scope :permitted, -> {joins(:permits).distinct}

  paginates_per 10


  def header
    name
  end
end
