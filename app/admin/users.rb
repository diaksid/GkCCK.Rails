ActiveAdmin.register User do
  menu parent: 'utils', priority: 0

  permit_params :email, :password, :password_confirmation,
                :is_admin, :in_staff,
                :name, :phone, :address,
                :image, :image_purge


  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  index do
    selectable_column
    id_column
    column :image, class: 'h-width--icon', sortable: false do |model|
      render partial: 'admin/image', object: model.image, locals: {href: edit_admin_user_path(model)}
    end
    column :email
    column :name
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end


  show do
    panel 'Авторизация' do
      attributes_table_for resource do
        row :email
        row :encrypted_password
        row :is_admin
        row :in_staff
      end
    end
    panel 'Профиль' do
      attributes_table_for resource do
        row :name
        row :phone
        row :address
      end
    end
    active_admin_comments
  end


  form do |f|
    f.semantic_errors
    f.inputs 'Авторизация' do
      f.input :email, as: :email,
              input_html: {class: 'h-width--20'}
      f.input :password,
              input_html: {class: 'h-width--20'}
      f.input :password_confirmation,
              input_html: {class: 'h-width--20'}
      f.input :is_admin,
              input_html: {disabled: !current_user.admin?}
      f.input :in_staff,
              input_html: {disabled: !current_user.admin?}
    end
    f.inputs 'Профиль' do
      f.input :name,
              input_html: {class: 'h-width--40'}
      f.input :phone, as: :phone,
              input_html: {class: 'h-width--40'}
      f.input :address
    end
    f.inputs do
      f.input :image, as: :file,
              input_html: {multiple: false, accept: 'image/*'}
      f.input :image_purge, as: :boolean,
              input_html: {disabled: !resource.image.attached?}
    end unless f.object.new_record?
    f.actions
  end


  sidebar I18n.t('active_admin.sidebars.state'),
          priority: 0, only: [:show, :edit, :update] do
    attributes_table do
      row :id
      row :updated_at
      row :created_at
    end
  end

  sidebar I18n.t('activerecord.attributes.user.image'),
          priority: 1, only: [:show, :edit, :update] do
    render partial: 'admin/image', object: resource.image, locals: {size: 192}
  end


  controller do
    def update
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete 'password'
        params[:user].delete 'password_confirmation'
      end
      begin
        super
      rescue
      else
        User.find(params[:id]).image.purge if params[:user][:image_purge] == '1'
      end
    end
  end
end
