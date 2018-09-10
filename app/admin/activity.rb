ActiveAdmin.register Activity do
  include AdminWebPage

  menu priority: 2

  permit_params :published, :navigated,
                :name, :header, :annotation, :content, :partial,
                :title, :keywords, :description, :canonical, :robots,
                :index, :parent_id,
                :images_purge, images: [], images_attachments_attributes: [:id, :index, :_destroy],
                area_ids: []

  includes :areas


  scope :all, default: true
  scope :unscoped

  filter :published
  filter :navigated
  filter :header
  filter :areas,
         input_html: {class: 'control-select'},
         unless: proc {Area.all.empty?}
  filter :created_at


  sortable tree: true,
           max_levels: 2,
           sorting_attribute: :index
  # config.paginate = true

  index default: true do
    selectable_column
    id_column
    column :ancestry_depth, class: 'h-width--int'
    column :index, class: 'h-width--int'
    column_aimg :image, class: 'h-width--icon'
    column :published, class: 'h-width--bool'
    column :navigated, class: 'h-width--bool'
    column :name
    column :areas, class: 'h-width--20' do |model|
      model.areas_show '<br>'
    end
    column :created_at, class: 'h-width--date'
    actions
  end

  index as: :sortable do
    label :name do |model|
      html = '%03i %s %s <i>[ %s ]</i> <span>%03i</span>' % [
        model.index,
        (model.published ? '<i>опубликовано</i>' : '<em>не опубликовано</em>'),
        (model.navigated ? '<i>в навигации</i>' : '<em>вне навигации</em>'),
        (model.areas.empty? ? '--' : model.areas_show),
        model.id
      ]
      html = "%s <small>%s</small>" % [model.name, html]
      html.html_safe
    end
    actions
  end


  show do
    attributes_table do
      row :published
      row :navigated
      row :areas do |model|
        model.areas_show '<br>'
      end
      row_html :header
      row_html :annotation, class: 'h-text--readable h-text--readable-min'
      row :partial
      row_html :content, class: 'h-text--readable'
    end
    panel I18n.t('active_admin.panels.images', count: resource.images.count) do
      render partial: 'admin/show/images'
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
          f.input :areas, as: :select, include_hidden: false, include_blank: false, multiple: true,
                  collection: Area.all.collect {|model| [model.name, model.id]},
                  input_html: {class: 'control-select control-select--full h-width--50',
                               size: Area.all.count} unless f.object.new_record? || Area.all.empty?
        end
=begin
        f.inputs do
          f.input :index, as: :number,
                  input_html: {class: 'h-width--10',
                               min: 0}
          f.input :parent_id, as: :select, include_blank: true,
                  collection: Activity.select_options,
                  input_html: {class: 'control-select'}
        end
=end
        f.inputs do
          f.input :name,
                  input_html: {class: 'h-width--40'}
          f.input :header
          f.input :annotation, as: :redactor,
                  wrapper_html: {class: 'redactor--min'}
          f.input :partial, as: :select, include_blank: false,
                  input_html: {class: 'control-select'}
          f.input :content, as: :redactor
        end
      end
      tab I18n.t('active_admin.panels.images', count: f.object.images.count) do
        render partial: 'admin/form/images', locals: {form: f}
      end unless f.object.new_record?
      tab I18n.t('active_admin.panels.seo') do
        render partial: 'admin/form/seo', locals: {form: f}
      end
    end
    f.actions
  end


  sidebar I18n.t('active_admin.sidebars.relations'),
          priority: 0, only: [:show, :edit, :update] do
    attributes_table do
      row :parent
      row :index
    end
  end

  sidebar I18n.t('active_admin.sidebars.state'),
          priority: 1, only: [:show, :edit, :update] do
    attributes_table_for resource do
      row :published
      row :navigated
      row :index
      row :id
      row :updated_at
      row :created_at
    end
  end

  sidebar I18n.t('activerecord.attributes.activity.image'),
          priority: 2, only: [:show, :edit, :update] do
    render partial: 'admin/image', object: resource.image,
           locals: {size: 192}
  end


  controller do
    def update
      params[:activity][:area_ids] = [] unless params[:activity].include? :area_ids
      purge = []
      if params[:activity].include? :images_attachments_attributes
        params[:activity][:images_attachments_attributes].each do |idx, param|
          if param[:_destroy] == '1'
            purge << param[:id]
            param[:_destroy] = '0'
          end
        end
      end
      begin
        super
      rescue
      else
        if params[:activity][:images_purge] == '1'
          Activity.find(params[:id]).images.purge
        elsif !purge.empty?
          ActiveStorage::Attachment.find(purge).each(&:purge)
        end
      end
    end
  end
end
