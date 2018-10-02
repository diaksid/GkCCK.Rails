class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :registerable, :recoverable,
  devise :database_authenticatable,
         :rememberable, :trackable, :validatable
  include HasImage


  has_many :partners
  accepts_nested_attributes_for :partners


  before_save :check_access


  default_scope { order(is_admin: :desc, in_staff: :desc, name: :asc, email: :asc) }
  scope :admin, -> { where(is_admin: true).order(:name, :email) }
  scope :staff, -> { where(in_staff: true).order(is_admin: :desc, name: :asc, email: :asc) }
  scope :client, -> { where(in_staff: false).order(is_admin: :desc, name: :asc, email: :asc) }


  def to_s
    (name.blank? ? email : name).to_s
  end


  def admin?
    is_admin
  end


  def staff?
    in_staff
  end


  private


  def check_access
    self.in_staff = true if is_admin
  end
end
