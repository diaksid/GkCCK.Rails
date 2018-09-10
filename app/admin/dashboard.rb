ActiveAdmin.register_page 'Dashboard' do
  menu priority: 0, label: proc{ I18n.t 'active_admin.dashboard' }

  content title: proc{ I18n.t 'active_admin.dashboard' } do
    columns do
      column do
        render partial: 'targets'
      end
      column do
        render partial: 'permits'
      end
      column do
        render partial: 'partners'
      end
    end

    panel 'Последние новости' do
      ul class: 'mt-1' do
        Article.recent(5).map do |model|
          li link_to(model.header, admin_article_path(model))
        end
      end
    end
  end

  sidebar I18n.t('activerecord.models.user.one') do
    h3 class: 'mt-1' do
      link_to(current_user, admin_user_path(current_user))
    end
    attributes_table_for current_user do
      row :is_admin
      row :sign_in_count
      row :current_sign_in_at do
        time_ago_in_words current_user.current_sign_in_at
      end
      row :current_sign_in_ip
    end
    attributes_table_for current_user do
      row I18n.t('activerecord.attributes.user.partners'),
          :partners do |model|
        link_to model.partners.count, admin_partners_path('q[user_id_eq]' => model)
      end
    end
  end
end
