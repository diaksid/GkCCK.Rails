ActiveAdmin.register Article do
  include AdminWebPage

  menu priority: 7

  permit_params :published, :published_at, :navigated,
                :header, :annotation, :content, :partial,
                :title, :keywords, :description, :canonical, :robots,
                :image


  scope :all, default: true
  scope :published

  filter :published_at
  filter :header
  filter :created_at
end
