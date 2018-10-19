ActiveAdmin.register Feedback do
  include AdminWebPage

  menu priority: 6

  permit_params :published, :published_at, :navigated,
                :header, :content,
                :title, :keywords, :description, :canonical, :robots,
                :partner_id, :partner_as, :source,
                :images_purge, images: [], images_attachments_attributes: [:id, :index, :_destroy]

  includes :partner, :images_attachments


  scope :all, default: true
  scope :source
  scope :unscoped

  filter :published
  filter :navigated
  filter :header
  filter :partner,
         input_html: {class: 'control-select'},
         unless: proc { Partner.all.empty? }
  filter :source
  filter :updated_at
  filter :created_at


  index do
    selectable_column
    id_column
    column :published, class: 'h-width--bool'
    column :published_at, class: 'h-width--date'
    column :blob, class: 'h-width--icon', sortable: false do |model|
      render partial: 'admin/image', object: model.image, locals: {href: edit_admin_feedback_path(model)}
    end
    column :header
    column :source, class: 'h-width--20'
    column :created_at
    actions
  end


  show do
    attributes_table do
      row :header
      row_html :content, class: 'readable'
      row :source
      row :partner
    end
    panel I18n.t('active_admin.panels.seo') do
      render partial: 'admin/show/seo'
    end
    active_admin_comments
  end


  form do |f|
    f.semantic_errors *f.object.errors.keys
    tabs do
      tab I18n.t('active_admin.panels.data') do
        f.inputs do
          f.input :published, as: :select, include_blank: false,
                  input_html: {class: 'control-select'}
          f.input :published_at, as: :date_picker
          f.input :navigated, as: :select, include_blank: false,
                  input_html: {class: 'control-select'}
        end
        f.inputs do
          f.input :header
          f.input :content, as: :redactor
        end
        f.inputs do
          f.input :partner, as: :select, include_hidden: true,
                  collection: Partner.all.collect { |model| [model.name, model.id] },
                  input_html: {class: 'control-select h-width--30'} unless Partner.all.empty?
          f.input :source,
                  input_html: {class: 'h-width--50'} unless Partner.all.empty?
        end
        f.inputs do
          f.input :image, as: :file,
                  input_html: {multiple: false, accept: 'image/*'}
          f.input :image_purge, as: :boolean,
                  input_html: {disabled: !resource.image.attached?}
        end unless f.object.new_record?
      end
      tab I18n.t('active_admin.panels.seo') do
        render partial: 'admin/form/seo', locals: {form: f}
      end
    end
    f.actions
  end


  sidebar I18n.t('active_admin.sidebars.state'),
          priority: 0, only: [:show, :edit, :update] do
    attributes_table_for resource do
      row :published
      row :published_at
      row :updated_at
      row :created_at
    end
  end

  sidebar I18n.t('activerecord.attributes.feedback.image'),
          priority: 1, only: [:show, :edit, :update] do
    render partial: 'admin/image', object: resource.image, locals: {size: 192}
  end


  controller do
    def create
      super do |format|
        redirect_to edit_admin_feedback_path(resource) and return if resource.valid?
      end
    end

    def update
      purge = []
      if params[:feedback].include? :images_attachments_attributes
        params[:feedback][:images_attachments_attributes].each do |idx, param|
          if param[:_destroy] == '1'
            purge << param[:id]
            param[:_destroy] = '0'
          end
        end
      end
      images = params[:feedback].include?(:images) ? params[:feedback].delete('images') : false
      super do |format|
        if resource.valid?
          if params[:feedback][:images_purge] == '1'
            resource.images.purge
          elsif !purge.empty?
            ActiveStorage::Attachment.find(purge).each(&:purge)
          end
          if images
            resource.images.attach images
          end
          if !resource.images.empty? && (!purge.empty? || images)
            resource.images.order(:index).each.with_index do |item, idx|
              item.update_column :index, idx
            end
          end
        end
      end
    end
  end
end
