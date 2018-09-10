ActiveAdmin.register Partner do
  include AdminActive
  include AdminWebPage

  menu priority: 3

  permit_params :published, :navigated,
                :active, :affiliate,
                :name, :content,
                :email, :phone, :address, :geo, :website,
                :title, :keywords, :description, :canonical, :robots,
                :index,
                :user_id,
                :image, :image_purge,
                targets_attributes: [:id, :index,
                                     :published, :navigated,
                                     :importance],
                permits_attributes: [:id, :index,
                                     :published, :navigated],
                feedbacks_attributes: [:id, :index,
                                       :published, :navigated]

  includes :targets, :permits, :feedbacks


  scope :all, default: true
  scope :unscoped

  filter :active
  filter :published
  filter :navigated
  filter :name
  filter :created_at


  sortable tree: false,
           sorting_attribute: :index
  # config.paginate = true


  index default: true do
    selectable_column
    id_column
    column :index, class: 'h-width--int'
    column_aimg :image, class: 'h-width--icon'
    column :active, class: 'h-width--bool'
    column :affiliate, class: 'h-width--bool'
    column :published, class: 'h-width--bool'
    column :navigated, class: 'h-width--bool'
    column :name
    column :email, class: 'h-width--10'
    column :phone, class: 'h-width--10'
    column :created_at, class: 'h-width--date'
    actions
  end

  index as: :sortable do
    label :name do |model|
      html = '%03i %s %s %s <span>%03i</span>' % [
        model.index,
        (model.active ? '<i>активно</i>' : '<em>не активно</em>'),
        (model.published ? '<i>опубликовано</i>' : '<em>не опубликовано</em>'),
        (model.navigated ? '<i>в навигации</i>' : '<em>вне навигации</em>'),
        model.id
      ]
      html = "%s <small>%s</small>" % [model.name, html]
      html.html_safe
    end
    actions
  end


  show do
    attributes_table do
      row_html :content, class: 'h-text--readable'
      row :email
      row :phone
      row :address
      row :geo
      row :website
    end
    panel I18n.t('active_admin.local.targets', count: resource.targets.count) do
      table_for resource.targets do
        column :index, class: 'h-width--int'
        column_aimg :image, class: 'h-width--icon'
        column :name
        column :created_at, class: 'h-width--date'
        column :id, class: 'h-width--int'
      end
    end unless resource.targets.empty?
    panel I18n.t('active_admin.local.permits', count: resource.permits.count) do
      table_for resource.permits do
        column :index, class: 'h-width--int'
        column_aimg :image, class: 'h-width--icon', fit: true
        column :name
        column :number
        column :created_at, class: 'h-width--date'
        column :id, class: 'h-width--int'
      end
    end unless resource.permits.empty?
    panel I18n.t('active_admin.local.feedbacks', count: resource.feedbacks.count) do
    end unless resource.feedbacks.empty?
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
          f.input :active, as: :select, include_blank: false,
                  input_html: {class: 'control-select'}
          # f.input :index, as: :number, input_html: {class: 'h-width--10', min: 0}
        end
        f.inputs do
          f.input :affiliate, as: :select, include_blank: false,
                  input_html: {class: 'control-select'}
          f.input :name,
                  input_html: {class: 'h-width--50'}
          f.input :content, as: :redactor
        end
        f.inputs do
          f.input :image, as: :file,
                  input_html: {multiple: false, accept: 'image/*'}
          f.input :image_purge, as: :boolean,
                  input_html: {disabled: !resource.image.attached?}
        end unless f.object.new_record?
      end
      tab I18n.t('active_admin.local.contacts') do
        f.inputs do
          f.input :phone, as: :phone,
                  input_html: {class: 'h-width--40'}
          f.input :email, as: :email,
                  input_html: {class: 'h-width--40'}
          f.input :address
          f.input :geo,
                  input_html: {class: 'h-width--20'}
          f.input :website,
                  input_html: {class: 'h-width--20'}
          f.input :user, as: :select, include_blank: true,
                  collection: User.all.collect {|u| [u.to_s, u.id]},
                  input_html: {class: 'control-select h-width--30'}
        end
      end
      tab I18n.t('active_admin.local.targets', count: f.object.targets.count) do
        f.inputs do
          f.has_many :targets, heading: false, class: 'has-attachment',
                     sortable: 'index', allow_destroy: false, new_record: false do |n|
            n.input :image, as: :attached_icon,
                    wrapper_html: {class: 'handle'}
            n.input :name,
                    input_html: {disabled: true}
            n.input :published, as: :select, include_blank: false,
                    input_html: {class: 'control-select'}
            n.input :navigated, as: :select, include_blank: false,
                    input_html: {class: 'control-select'}
            n.input :importance, as: :select, include_blank: false,
                    collection: Target::IMPORTANTS.to_a,
                    input_html: {class: 'control-select'}
          end
        end
      end unless f.object.targets.empty?
      tab I18n.t('active_admin.local.permits', count: f.object.permits.count) do
        f.inputs do
          f.has_many :permits, heading: false, class: 'has-attachment',
                     sortable: 'index', allow_destroy: false, new_record: false do |n|
            n.input :image, as: :attached_icon, fit: true,
                    wrapper_html: {class: 'handle'}
            n.input :name,
                    input_html: {disabled: true}
            n.input :number,
                    input_html: {disabled: true}
            n.input :published, as: :select, include_blank: false,
                    input_html: {class: 'control-select'}
            n.input :navigated, as: :select, include_blank: false,
                    input_html: {class: 'control-select'}
          end
        end
      end unless f.object.permits.empty?
      tab I18n.t('active_admin.local.feedbacks', count: f.object.feedbacks.count) do
      end unless f.object.feedbacks.empty?
      tab I18n.t('active_admin.panels.seo') do
        render partial: 'admin/form/seo', locals: {form: f}
      end
    end
    f.actions
  end


  sidebar I18n.t('active_admin.sidebars.state'),
          priority: 0, only: :show do
    attributes_table_for resource do
      row :published
      row :navigated
      row :active
      row :affiliate
      row :index
      row :id
      row :updated_at
      row :created_at
    end
  end

  sidebar I18n.t('active_admin.sidebars.relations'),
          priority: 1, only: [:show, :edit, :update] do
    attributes_table do
      row :targets do |model|
        link_to model.targets.count, admin_targets_path('q[partner_id_eq]' => model)
      end
      row :permits do |model|
        link_to model.permits.count, admin_permits_path('q[partner_id_eq]' => model)
      end
      row :feedbacks do |model|
        link_to model.feedbacks.count, admin_feedbacks_path('q[partner_id_eq]' => model)
      end
    end
  end

  sidebar I18n.t('activerecord.attributes.partner.image'),
          priority: 2, only: [:show, :edit, :update] do
    render partial: 'admin/image', object: resource.image, locals: {size: 192}
  end


  controller do
    def update
      begin
        super
      rescue
      else
        Partner.find(params[:id]).image.purge if params[:partner][:image_purge] == '1'
      end
    end
  end
end
