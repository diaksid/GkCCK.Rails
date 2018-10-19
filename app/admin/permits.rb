ActiveAdmin.register Permit do
  include AdminWebPage

  menu priority: 5

  permit_params :published, :navigated,
                :name, :header, :number, :provider, :issue_at, :onset_at, :end_at,
                :title, :keywords, :description, :canonical, :robots,
                :index,
                :partner_id,
                :images_purge, images: [], images_attachments_attributes: [:id, :index, :_destroy]

  includes :partner, :images_attachments


  scope :all, default: true
  scope :active
  scope :inactive
  scope :unscoped

  filter :published
  filter :navigated
  filter :partner,
         input_html: {class: 'control-select'},
         unless: proc {Partner.all.empty?}
  filter :name
  filter :number
  filter :provider
  filter :created_at

  sortable tree: false,
           sorting_attribute: :index
  # config.paginate = true

  index do
    selectable_column
    id_column
    column :index, class: 'h-width--int'
    column_aimg :image, class: 'h-width--icon',fit: true
    column :active?, class: 'h-width--bool'
    column :published, class: 'h-width--bool'
    column :navigated, class: 'h-width--bool'
    column_html :name
    column :partner, sortable: :partner_id
    column :created_at
    actions
  end

  index as: :sortable do
    label :name do |model|
      html = '%03i %s %s <span>%03i <i>%s</i></span>' % [
        model.index,
        (model.published ? '<i>опубликовано</i>' : '<em>не опубликовано</em>'),
        (model.navigated ? '<i>в навигации</i>' : '<em>вне навигации</em>'),
        model.id,
        (model.partner.nil? ? '--' : model.partner.name)
      ]
      html = "%s <small>%s</small>" % [model.name, html]
      html.html_safe
    end
    actions
  end


  show do
    attributes_table do
      row_html :header
      row :number
      row :provider
      row :issue_at
      row :onset_at
      row :end_at
      row :partner
    end
    panel I18n.t('active_admin.panels.images', count: resource.images.count) do
      render partial: 'admin/show/images',
             locals: {fit: true}
    end unless resource.images.empty?
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
          f.input :navigated, as: :select, include_blank: false,
                  input_html: {class: 'control-select'}
          # f.input :index, as: :number, input_html: {class: 'h-width--10', min: 0}
        end
        f.inputs do
          f.input :partner, as: :select, include_hidden: true,
                  collection: Partner.active.collect {|model| [model.name, model.id]},
                  input_html: {class: 'control-select h-width--40'} unless Partner.active.empty?
          f.input :name
          f.input :header
          f.input :number,
                  input_html: {class: 'h-size--50'}
          f.input :provider
          f.input :issue_at, as: :date_picker
          f.input :onset_at, as: :date_picker
          f.input :end_at, as: :date_picker
        end
      end
      tab I18n.t('active_admin.panels.images', count: f.object.images.count) do
        render partial: 'admin/form/images',
               locals: {form: f,
                        fit: true}
      end unless f.object.new_record?
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
      row :navigated
      row :index
      row :id
      row :updated_at
      row :created_at
    end
  end

  sidebar I18n.t('activerecord.attributes.permit.image'),
          priority: 1, only: [:show, :edit, :update] do
    render partial: 'admin/image', object: resource.image,
           locals: {size: 192,
                    fit: true}
  end


  controller do
    def create
      super do |format|
        redirect_to edit_admin_permit_path(resource) and return if resource.valid?
      end
    end

    def update
      purge = []
      if params[:permit].include? :images_attachments_attributes
        params[:permit][:images_attachments_attributes].each do |idx, image|
          if image[:_destroy] == '1'
            purge << image[:id]
            image[:_destroy] = '0'
          end
        end
      end
      images = params[:permit].include?(:images) ? params[:permit].delete('images') : false
      super do |format|
        if resource.valid?
          if params[:permit][:images_purge] == '1'
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
