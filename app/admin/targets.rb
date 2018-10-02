ActiveAdmin.register Target do
  include AdminWebPage

  menu priority: 4

  permit_params :published, :navigated,
                :importance, :start_at, :finish_at,
                :name, :header, :content,
                :address, :geo, :website,
                :title, :keywords, :description, :canonical, :robots,
                :index,
                :partner_id, :partner_as,
                :images_purge, images: [], images_attachments_attributes: [:id, :index, :_destroy],
                area_ids: []

  includes :partner, :areas, :images_attachments


  scope :all, default: true
  scope :individual
  scope :unscoped

  filter :name
  filter :published
  filter :navigated
  filter :importance, as: :select, collection: Target::IMPORTANTS.to_a,
         input_html: {class: 'control-select'}
  filter :areas,
         input_html: {class: 'control-select'},
         unless: proc {Area.all.empty?}
  filter :partner,
         input_html: {class: 'control-select'},
         include_blank: true,
         unless: proc {Partner.all.empty?}
  filter :created_at

  sortable tree: false,
           sorting_attribute: :index
  # config.paginate = true

  index default: true do
    selectable_column
    id_column
    column :partner, sortable: :partner_id
    column :index, class: 'h-width--int'
    column_aimg :image, class: 'h-width--icon'
    column :published, class: 'h-width--bool'
    column :navigated, class: 'h-width--bool'
    column :importance, class: 'h-width--10' do |model|
      Target::IMPORTANTS.key model.importance
    end
    column :name
    column :areas, class: 'h-width--20' do |model|
      model.areas_show '<br>'
    end
    column :created_at, class: 'h-width--date'
    actions
  end

  index as: :sortable do
    label :name do |model|
      html = '%03i %s %s <i>[ %s ]</i> <span>%03i <i>%s</i></span>' % [
        model.index,
        (model.published ? '<i>опубликовано</i>' : '<em>не опубликовано</em>'),
        (model.navigated ? '<i>в навигации</i>' : '<em>вне навигации</em>'),
        (model.areas.empty? ? '--' : model.areas_show),
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
      row :header
      row_html :content, class: 'h-text--readable'
      row :address
      row :geo
      row :website
    end
    panel 'Деятельность' do
      attributes_table_for resource do
        row :importance do |model|
          Target::IMPORTANTS.key model.importance
        end
        row :partner
        row :partner_as
        row :areas do |model|
          model.areas_show '<br>'
        end
        row :start_at
        row :finish_at
      end
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
          # f.input :index, as: :number,
          #         input_html: {class: 'h-width--int',
          #                      min: 0}
          f.input :importance, as: :select, include_blank: false,
                  collection: Target::IMPORTANTS.to_a,
                  input_html: {class: 'control-select'}
        end
        f.inputs do
          f.input :name,
                  input_html: {class: 'h-width--40'}
          f.input :header
          f.input :content, as: :redactor
        end
        f.inputs do
          f.input :address
          f.input :geo,
                  input_html: {class: 'h-width--20'}
          f.input :website,
                  input_html: {class: 'h-width--20'}
        end
      end
      tab I18n.t('active_admin.panels.activity') do
        f.inputs do
          f.input :partner, as: :select, include_hidden: true,
                  collection: Partner.active.collect {|model| [model.name, model.id]},
                  input_html: {class: 'control-select h-width--40'} unless Partner.active.empty?
          f.input :partner_as
          f.input :start_at, as: :date_picker
          f.input :finish_at, as: :date_picker
          f.input :areas, as: :select, include_hidden: false, include_blank: false, multiple: true,
                  collection: Area.all.collect {|model| [model.name, model.id]},
                  input_html: {class: 'control-select control-select--full h-widt--50',
                               size: Area.all.count} unless Area.all.empty?
        end
      end unless f.object.new_record?
      tab I18n.t('active_admin.panels.images', count: f.object.images.count) do
        render partial: 'admin/form/images', locals: {form: f}
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

  sidebar I18n.t('active_admin.sidebars.relations'),
          priority: 1, only: [:show, :edit, :update] do
    attributes_table do
      row :images do |model|
        link_to model.images.count, admin_active_storage_attachments_path('q[record_type_eq]': Target,
                                                                          'q[record_id_eq]': model.id)
      end
    end
  end

  sidebar I18n.t('activerecord.attributes.target.image'),
          priority: 2, only: [:show, :edit, :update] do
    render partial: 'admin/image', object: resource.image,
           locals: {size: 192}
  end


  action_item :indexing, only: :index do
    link_to I18n.t('active_admin.action_items.indexing'),
            indexing_admin_targets_path,
            method: :patch
  end


  collection_action :indexing, method: :patch do
    Partner.all.each do |model|
      model.targets.order(:index).each.with_index do |item, idx|
        item.update_column :index, idx
      end
    end
    Target.individual.order(:index).each.with_index do |item, idx|
      item.update_column :index, idx
    end
    redirect_back fallback_location: admin_targets_path,
                  notice: I18n.t('active_admin.collection_actions.indexing')
  end


  controller do
    def update
      params[:target][:area_ids] = [] unless params[:target].include? :area_ids
      purge = []
      if params[:target].include? :images_attachments_attributes
        params[:target][:images_attachments_attributes].each do |idx, param|
          if param[:_destroy] == '1'
            purge << param[:id]
            param[:_destroy] = '0'
          end
        end
      end
      images = params[:target].include?(:images) ? params[:target].delete('images') : false
      super do |format|
        if resource.valid?
          if params[:target][:images_purge] == '1'
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
