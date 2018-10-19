ActiveAdmin.register Article do
  include AdminWebPage

  menu priority: 7

  permit_params :published, :published_at, :navigated,
                :header, :annotation, :content, :partial,
                :title, :keywords, :description, :canonical, :robots,
                :image, :image_purge


  scope :all, default: true
  scope :published

  filter :published_at
  filter :header
  filter :created_at


  controller do
    def create
      super do |format|
        redirect_to edit_admin_article_path(resource) and return if resource.valid?
      end
    end


    def update
      image = params[:article].include?(:image) ? params[:article].delete('image') : false
      super do |format|
        if resource.valid?
          if params[:article][:image_purge] == '1'
            resource.image.purge
          end
          if image
            resource.image.attach image
          end
        end
      end
    end
  end
end
